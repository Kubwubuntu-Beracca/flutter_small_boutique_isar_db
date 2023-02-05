import 'package:boutique/presentation/screens/category/add_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../providers/isar_services.dart';
import '../../../widgets/show_snackbar_item.dart';
import 'add_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = '/products';
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<IsarServices>(context).getAllProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<IsarServices>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddProuctScreen.routeName);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Text(products[index].id.toString()),
                              title: Text(products[index].name),
                              subtitle: Text(products[index].price),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                          AddProuctScreen.routeName,
                                          arguments: products[index].id,
                                        );
                                        print('Id:${products[index].id}');
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    Consumer<IsarServices>(
                                      builder: (_, prod, ch) => IconButton(
                                        onPressed: () {
                                          print(products[index].id);
                                          prod.deleteProduct(
                                              products[index].id);
                                          CustomSnackBar.mySnackBar(context,
                                              '${products[index].name} product delete from DB');
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
    );
  }
}
