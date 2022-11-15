import 'package:get/get.dart';

abstract class BaseController extends GetxController {

  RxBool isPageLoading = RxBool(false);
  RxBool isPageLoadingMore = RxBool(false);
  RxBool errorHappen = RxBool(false);

  showLoading() => isPageLoading.value = true;
  hideLoading() => isPageLoading.value = false;
}
