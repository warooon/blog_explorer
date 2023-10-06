import 'package:blog_explorer/app/controllers/blog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/blog_data.dart';

class BlogItem extends StatelessWidget {
  final blogController = Get.find<BlogController>();
  final Blog blog;
  final VoidCallback onTap;

  BlogItem({
    required this.blog,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16), // Add padding here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                blog.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Obx(
                    () {
                      return IconButton(
                        icon: Icon(
                          blog.isFav.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: blog.isFav.value ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          blogController.toggleFav(blog);
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
