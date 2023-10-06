import 'package:get/get.dart';

import '../modules/blog_detail_screen/views/blog_detail_screen.dart';
import '../modules/blog_list_screen/views/blog_list_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BlogListScreen;

  static final routes = [
    GetPage(
      name: _Paths.BlogListScreen,
      page: () => BlogListScreen(),
      // binding: BlogListBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.BlogDetailScreen,
      page: () => BlogDetailScreen(blogTitle: '',),
      // binding: BlogDetailBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
