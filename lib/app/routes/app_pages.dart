import 'package:get/get.dart';
import '../modules/blog_detail_screen/views/blog_detail_screen.dart';
import '../modules/blog_list_screen/views/blog_list_screen.dart';
import '../modules/offline_blogs/views/offline_blogs.dart';


part 'app_routes.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.BlogListScreen,
      page: () => BlogListScreen(),
    ),
    GetPage(
      name: Routes.BlogDetailScreen,
      page: () => BlogDetailScreen(blogTitle: '',),
    ),
    GetPage(
      name: Routes.OfflineBlogs, 
      page: () => OfflineBlogs(),
    ),
  ];
}
