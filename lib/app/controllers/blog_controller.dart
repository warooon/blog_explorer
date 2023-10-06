import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/blog_data.dart';

class BlogController extends GetxController {
  var blogs = <Blog>[].obs;
  late Box<Blog> likedBlogsBox;

  final String apiUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  @override
  void onInit() {
    super.onInit();
    initializeHive();
    fetchBlogs();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    likedBlogsBox = await Hive.openBox<Blog>('liked_blogs');
  }

    Future<void> initializeHive() async {
    if (!Hive.isBoxOpen('liked_blogs')) {
      await initHive();
    }
  }

  Future<void> fetchBlogs() async {
    try {
      final response = await GetConnect().get(
        apiUrl,
        headers: {
          'x-hasura-admin-secret': adminSecret,
        },
      );

      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.body;
        final List<dynamic> blogList = responseData['blogs'];

        final List<Blog> fetchedBlogs =
            blogList.map((json) => Blog.fromJson(json)).toList();

        blogs.assignAll(fetchedBlogs);
      } else {
        Get.snackbar(
          'Error',
          'Failed to fetch blogs. Status Code: ${response.statusCode}',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  void toggleFav(Blog blog) {
    final index = blogs.indexWhere((b) => b.id == blog.id);
    if (index != -1) {
      blogs[index].isFav.value = !blogs[index].isFav.value;

      if (blogs[index].isFav.value) {
        likedBlogsBox.put(blog.id, blog);
      } else {
        likedBlogsBox.delete(blog.id);
      }

      update([blogs[index]]);
    }
  }
}
