import 'package:get/get.dart';
import 'package:wordup/Feature/Test/Controllers/home.dart';
import 'package:wordup/Feature/Test/Pages/home.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: BindingsBuilder(
        () {
          Get.put(HomeController());
        },
      ),
    ),
  ];
}
