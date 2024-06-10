import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_deep_links/view/deep_link_parser.dart';
import 'package:getx_deep_links/view/routes.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

void main() async{
  var firstScreen =  await DeepLinkParser().getFirstScreen();
  runApp( MainApp(firstScreen: firstScreen));
}

class MainApp extends StatelessWidget {
  final Widget firstScreen;
   const MainApp({super.key, required this.firstScreen});

  @override
  Widget build(BuildContext context)  {
    return GetMaterialApp(
      home:  firstScreen,
      getPages: Routes.routes,
      navigatorObservers: [NavigationHistoryObserver()],
      debugShowCheckedModeBanner: false,
    );
  }
}

