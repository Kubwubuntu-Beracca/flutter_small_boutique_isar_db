import 'package:boutique/providers/products.dart';
import 'package:boutique/widgets/cart.dart';
import 'package:boutique/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final products = Provider.of<Products>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boutique App'),
        actions: [CartWidget()],
      ),
      body: Container(),
      // Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: GridView.builder(
      //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         childAspectRatio: 3 / 2,
      //         crossAxisSpacing: 10,
      //         mainAxisSpacing: 10,
      //       ),
      //       itemCount: products.length,
      //       itemBuilder: (context, index) {
      //         return ClipRRect(
      //           borderRadius: BorderRadius.circular(10),
      //           child: Container(
      //             color: Colors.blueGrey.withOpacity(0.2),
      //             child: GridTile(
      //               footer: GridTileBar(
      //                 backgroundColor: Colors.black54,
      //                 leading: const Text('Price'),
      //                 title: Text(
      //                   products[index].price,
      //                   style: const TextStyle(color: Colors.black),
      //                 ),
      //               ),
      //               child: Center(child: Text(products[index].name)),
      //             ),
      //           ),
      //         );
      //       }),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-category');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
