import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_deep_links/model/product.dart';
import 'package:getx_deep_links/service/mock_product_service.dart';
import 'package:getx_deep_links/view/routes.dart';
import 'package:getx_deep_links/view/widgets/navigation_history.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = MockProductService().getAll();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product list"),
        centerTitle: true,
         automaticallyImplyLeading: false,
        leading: IconButton(
          icon:  const Icon(Icons.arrow_back),
          onPressed: () => Get.offAllNamed(Routes.HOME),
        ),
      ),
      body: Center(
          child: Column(
            children: [
              const NavigationHistory(),
              Flexible(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                title: Text(
                  products[index].title,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  'Price: \$${products[index].price}',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Get.toNamed('${Routes.PRODUCT}/${products[index].id}');
                },
                          );
                    },
                  ),
              ),
            ]
          )),
    );
  }
}
