import 'package:get/get.dart';

class Blog {
  final String id;
  final String title;
  final String imageUrl;
  final RxBool isFav;

  Blog({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.isFav,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      isFav: false.obs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image_url': imageUrl,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Blog && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
