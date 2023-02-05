import 'package:boutique/providers/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drop_down_menu/flutter_drop_down.dart';
import 'package:provider/provider.dart';

import '../../../models/category.dart';

class AddProuctScreen extends StatefulWidget {
  static const routeName = '/add-product';

  @override
  State<AddProuctScreen> createState() => _AddProuctScreenState();
}

class _AddProuctScreenState extends State<AddProuctScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  final titleController = TextEditingController();

  final categoryController = TextEditingController();

  final priceController = TextEditingController();

  List<Category> selectedCategories = [];

  var _isInit = true;
  List<String> _items = [];
  String? dropdwnItem;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      await Provider.of<Categories>(
        context,
      ).getAllCategories();
      final categories =
          await Provider.of<Categories>(context, listen: false).categories;
      _items = categories
          .map(
            (cat) => cat.title,
          )
          .toList();
      print('List of String:${_items}');
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            DropdownButton<String>(
              value: dropdwnItem,
              isExpanded: true,
              hint: const Text('Select categories'),
              onChanged: (val) {
                setState(() {
                  this.dropdwnItem = val.toString();
                });
              },
              items: _items.map((itemone) {
                return DropdownMenuItem(
                  value: itemone,
                  child: Text(
                    itemone,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
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
