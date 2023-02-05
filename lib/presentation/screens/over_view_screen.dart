import 'package:boutique/providers/cart.dart';
import 'package:boutique/services/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/isar_services.dart';
import '../../widgets/cart_item.dart';

class ProductsOverView extends StatefulWidget {
  const ProductsOverView({super.key});

  @override
  State<ProductsOverView> createState() => _ProductsOverViewState();
}

class _ProductsOverViewState extends State<ProductsOverView> {
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
    final products = Provider.of<IsarServices>(context, listen: false).products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boutique App'),
        actions: [
          Consumer<Cart>(
            builder: ((_, cart, ch) => CartWidget(
                  value: cart.itemCount.toString(),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context);
                    },
                  ),
                )),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.blueGrey.withOpacity(0.2),
                        child: GridTile(
                          footer: GridTileBar(
                            backgroundColor: Colors.black54,
                            leading: Text(
                              '${products[index].price} FBU',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            title: Container(),
                            trailing: Container(
                              width: 50.0,
                              child: Consumer<Cart>(
                                builder: ((context, value, child) => IconButton(
                                      icon: const Icon(Icons.shopping_cart),
                                      onPressed: () {
                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .addItem(
                                          products[index].id.toString(),
                                          int.parse(products[index].price),
                                          products[index].name,
                                          products[index].category,
                                        );
                                      },
                                    )),
                              ),
                            ),
                          ),
                          child: Center(child: Text(products[index].name)),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
