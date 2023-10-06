import 'package:get/get.dart';
import '../data/blog_data.dart';

class BlogController extends GetxController {
  var blogs = <Blog>[].obs;

  final String apiUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  @override
  void onInit() {
    super.onInit();
    fetchBlogs();
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
      print(
          'Toggled fav for blog with id ${blog.id}, new isFav value: ${blogs[index].isFav}');

      update([blogs[index]]);
    }
  }
}
