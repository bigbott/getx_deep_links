import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:getx_deep_links/view/screens/home.dart';
import 'package:getx_deep_links/view/screens/product_screen.dart';
import 'package:getx_deep_links/view/screens/product_list.dart';

class DeepLinkParser {
  DeepLinkParser._();
  static final _instance = DeepLinkParser._();
  factory DeepLinkParser() => _instance;

  final _appLinks = AppLinks();

  Future<Uri?> getInitialLink() async {
    return _appLinks.getInitialAppLink();
  }

  Future <Widget> getFirstScreen() async {
    Uri? uri = await getInitialLink();
    if (uri == null){
      return const Home();
    }

    String fragment = uri.fragment;
    if (fragment.contains('/product-list')){
      return const ProductList();
    }

    if (fragment.contains('/product/')){
      var lastIndexOfSlash = fragment.lastIndexOf('/');
      if (lastIndexOfSlash == fragment.length - 1){
        return const ProductList();
      }
      String id = fragment.substring(lastIndexOfSlash + 1);
      return ProductScreen.withId(id: id);
    }

    return const Home();
  }


}





// void listenToLinks() {
//   // Handle links
//   _appLinks.uriLinkStream.listen((uri) {
//     //print('onAppLink: $uri');
//     //navigateToRoute(uri);
//     //return uri;
//   });
// }
