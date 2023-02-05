import 'package:boutique/presentation/screens/category/categories_screen.dart';
import 'package:boutique/presentation/screens/product/produts_over_view_screen.dart';
import 'package:boutique/providers/products.dart';
import 'package:boutique/widgets/cart.dart';
import 'package:boutique/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = [
    const ProductsOverView(),
    const MenuScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ((index) => setState(() {
              currentIndex = index;
            })),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Menu',
            icon: Icon(Icons.menu),
          )
        ],
      ),
    );
  }
}
