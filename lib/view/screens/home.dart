

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_deep_links/view/routes.dart';
import 'package:getx_deep_links/view/widgets/navigation_history.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [  
            const NavigationHistory(),
             ElevatedButton(
                child: const Text('Browse products'),
                onPressed: () {
                  Get.toNamed(Routes.PRODUCT_LIST);
                })
           
          ],
        ),
      ),
    );
  }

}