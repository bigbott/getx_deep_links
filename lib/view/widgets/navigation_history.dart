

import 'package:flutter/material.dart';
import 'package:getx_deep_links/view/routes.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

class NavigationHistory extends StatelessWidget {
  const NavigationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return  Wrap(alignment: WrapAlignment.spaceBetween, children: [
              const Text("Routes in stack: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              for (Route page in NavigationHistoryObserver().history) 
              Text("${page.settings.name!}, ", style: 
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                         color: getColor(page.settings.name!)),)
            ]);
  }
  
  Color? getColor(String s) {
    switch (s) {
      case Routes.HOME:
        return const Color.fromRGBO(63, 19, 121, 1);
        case Routes.PRODUCT_LIST:
        return const Color.fromRGBO(255, 11, 65, 34);
        
      default:
        return Color.fromRGBO(13, 102, 58, 0.949);
    }
  }
   
}