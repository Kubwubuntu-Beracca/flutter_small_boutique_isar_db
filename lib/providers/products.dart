import 'package:boutique/models/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    // Product(

    //   name: 'Red Shirt',
    //   category: 'A red shirt - it is pretty red!',
    //   price: '29.99',
    // ),
    // Product(

    //   name: 'Yellow Scarf',
    //   category: 'A red shirt - it is pretty red!',
    //   price: '19.99',
    // ),
    // Product(

    //   name: 'A Pan',
    //   category: 'A red shirt - it is pretty red!',
    //   price: '59.99',
    // ),
    // Product(

    //   name: 'Trousers',
    //   category: 'A red shirt - it is pretty red!',
    //   price: '59.99',
    // ),
  ];
  List<Product> get items => _items;
  // void addProduc(Product product) {
  //   final newProd = Product(
  //     name: product.name,
  //     category: product.category,
  //     price: product.price,
  //   );
  //   _items.add(newProd);
  //   notifyListeners();
  // }
}
