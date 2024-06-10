

import 'package:getx_deep_links/model/product.dart';
import 'package:getx_deep_links/service/product_service.dart';

class MockProductService implements ProductService {

   static final  _instance = MockProductService._();

   MockProductService._();

   factory MockProductService () {return  _instance;}
  

  @override
  List<Product> getAll() {
    List<Product> products = [];
    products.add(Product(id: '123', title: 'Office table', 
    description: 'Nice office table', price: 100));
     products.add(Product(id: '124', title: 'Office chair', 
    description: 'Nice office chair', price: 90));
    products.add(Product(id: '125', title: 'UPS', 
    description: 'Uninterupted power supply', price: 121));

    return products;
  }

  @override
  Product? getById(String id) {
    for (Product p in getAll()){
      if (p.id == id){
        return p;
      }
    }
    return null;
  }

}