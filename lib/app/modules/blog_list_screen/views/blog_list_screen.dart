import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/blog_controller.dart';
import '../../../data/blog_data.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/blog_design.dart';
import '../../blog_detail_screen/views/blog_detail_screen.dart';

class BlogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blogController = Get.find<BlogController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Blog Explorer"),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Get.toNamed(Routes.OfflineBlogs);
            },
          ),
        ],
      ),
      body: Obx(
        () {
          final List<Blog> blogs = blogController.blogs;

          if (blogs.isEmpty) {
            return Center(
              child: Text(
                "Can't fetch blogs",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white), // Set text color to white
              ),
            );
          }

          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return BlogItem(
                blog: blog,
                onTap: () {
                  Get.to(BlogDetailScreen(blogTitle: blog.title));
                },
              );
            },
          );
        },
      ),
    );
  }
}
