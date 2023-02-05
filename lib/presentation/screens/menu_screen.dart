import 'package:boutique/presentation/screens/category/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'product/add_product_screen.dart';
import 'product/products_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              child: const Text(
                'Management',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(CategoriesScreen.routeName);
              },
              child: const ListTile(
                leading: Icon(Icons.category),
                title: Text('Categories'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(ProductsScreen.routeName);
              },
              child: const ListTile(
                leading: Icon(Icons.production_quantity_limits),
                title: Text('Products'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
