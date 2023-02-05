import 'package:boutique/presentation/screens/category/add_category_screen.dart';
import 'package:boutique/presentation/screens/product/add_product_screen.dart';
import 'package:boutique/presentation/screens/category/categories_screen.dart';
import 'package:boutique/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

import '../screens/cart/cart_screen.dart';
import '../screens/product/products_screen.dart';

class AppRouter {
  Map<String, Widget Function(BuildContext)> routes = {
    AddProuctScreen.routeName: (ctx) => AddProuctScreen(),
    AddCategoryScreen.routeName: (ctx) => AddCategoryScreen(),
    CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
    ProductsScreen.routeName: (ctx) => const ProductsScreen(),
    CartScreen.routeName: (ctx) => const CartScreen(),
  };
}
