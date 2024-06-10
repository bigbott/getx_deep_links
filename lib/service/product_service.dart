

import '../model/product.dart';

abstract class ProductService {
    Product? getById (String id);
    List<Product> getAll();
}