import 'package:boutique/presentation/screens/add_category.dart';
import 'package:boutique/presentation/screens/add_product.dart';
import 'package:boutique/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/add-product':
        return MaterialPageRoute(builder: (_) => AddProuctScreen());

      case '/add-category':
        return MaterialPageRoute(builder: (_) => AddCategoryScreen());
    }
  }
}
