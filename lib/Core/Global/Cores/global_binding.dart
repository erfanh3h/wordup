import 'package:get/get.dart';

import '../Controllers/global_controller.dart';
import 'global_repository.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController(Get.find<GlobalRepository>()));
  }
}
