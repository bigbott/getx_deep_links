// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_deep_links/model/product.dart';
import 'package:getx_deep_links/service/mock_product_service.dart';
import 'package:getx_deep_links/view/product_back_button_dispatcher.dart';

import '../widgets/navigation_history.dart';

class ProductScreen extends StatelessWidget {
  String? id;
  ProductScreen.withId({super.key, required this.id});

  ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    id ??= Get.parameters['id'];
    Product product = MockProductService().getById(id!)!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product ${product.id}'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(
            onPressed: () => ProductBackButtonDispatcher().back()),
        // leading: IconButton(
        //   icon:  const Icon(Icons.arrow_back),
        //   onPressed: () => back_dispatcher.BackButtonDispatcher().back(),
        // ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const NavigationHistory(),
            Text(
              product.title,
              style: TextStyle(color: Colors.deepPurple.shade900, fontSize: 25),
            ),
            const SizedBox(height: 20),
            Text(
              product.description,
              style: TextStyle(
                  color: Get.theme.colorScheme.tertiary, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Text(
              '\$${product.price.toString()}',
              style: TextStyle(color: Colors.amber.shade900, fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}
