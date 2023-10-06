import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blog_explorer/app/controllers/blog_controller.dart';
import 'package:blog_explorer/app/data/blog_data.dart';
import 'package:blog_explorer/app/widgets/blog_design.dart';
import '../../blog_detail_screen/views/blog_detail_screen.dart';

class OfflineBlogs extends StatelessWidget {
  final blogController = Get.find<BlogController>();

  @override
  Widget build(BuildContext context) {
    final List<Blog> likedBlogs = blogController.likedBlogsBox.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Liked Blogs"),
      ),
      body: likedBlogs.isEmpty
          ? Center(
              child: Text(
                "No offline Blogs yet",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: likedBlogs.length,
              itemBuilder: (context, index) {
                final blog = likedBlogs[index];
                return BlogItem(
                  blog: blog,
                  onTap: () {
                    Get.to(BlogDetailScreen(blogTitle: blog.title));
                  },
                );
              },
            ),
    );
  }
}
