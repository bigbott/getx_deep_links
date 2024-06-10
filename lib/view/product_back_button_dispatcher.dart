import 'package:get/get.dart';
import 'package:getx_deep_links/view/routes.dart';

class ProductBackButtonDispatcher {
  ProductBackButtonDispatcher._();
  static final _instance = ProductBackButtonDispatcher._();
  factory ProductBackButtonDispatcher() => _instance;

  void back() {
    if ('/' == Get.previousRoute) {
      Get.toNamed(Routes.PRODUCT_LIST);
      return;
    }
    if ('/product-list' == Get.previousRoute) {
      Get.back();
      return;
    }
    if (Get.previousRoute.contains('/product')) {
      if (hasId(Get.previousRoute)) {
        Get.back();
        return;
      }
      Get.close(2);
      Get.toNamed(Routes.PRODUCT_LIST);
    }
  }

  bool hasId(String previousRoute) {
    return previousRoute.length >= 12;
  }
}
