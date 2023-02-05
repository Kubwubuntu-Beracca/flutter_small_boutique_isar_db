import 'package:boutique/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddProuctScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    // initialValue: _initValues['title'],
                    decoration: const InputDecoration(labelText: 'Id'),
                    //...
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      // FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please provide the title';
                      }
                      return null;
                    },

                    onSaved: (value) {
                      // _editedProd = Product(
                      //   name: _editedProd.name,
                      //   price: _editedProd.price,
                      //   category: _editedProd.category,

                      // );
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Category'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Price'),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
