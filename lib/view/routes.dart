// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:getx_deep_links/view/screens/home.dart';
import 'package:getx_deep_links/view/screens/product_screen.dart';
import 'package:getx_deep_links/view/screens/product_list.dart';

class Routes {
  static const HOME = '/';
  static const PRODUCT_LIST = '/product-list';
  static const PRODUCT = '/product';

  static final routes = [
    GetPage(
      name: HOME,
      page: () => const Home(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: PRODUCT_LIST,
      page: () => const ProductList(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: '$PRODUCT/:id',
      page: () =>  ProductScreen(),
      transition: Transition.circularReveal,
      preventDuplicates: false,
    ),
  ];
}
