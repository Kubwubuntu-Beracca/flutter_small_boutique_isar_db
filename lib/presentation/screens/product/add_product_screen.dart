import 'package:boutique/models/product.dart';
import 'package:boutique/providers/isar_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drop_down_menu/flutter_drop_down.dart';
import 'package:provider/provider.dart';

import '../../../models/category.dart';
import '../../../widgets/show_snackbar_item.dart';

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
  var verifierId;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      await Provider.of<IsarServices>(
        context,
      ).getAllCategories();
      final categories =
          await Provider.of<IsarServices>(context, listen: false).categories;
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

  void _clear() {
    titleController.text = '';
    priceController.text = '';
    //dropdwnItem = null;
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (verifierId != null) {
        print('UPDATE');
      } else {
        Provider.of<IsarServices>(context, listen: false).saveProduct(Product()
          ..name = titleController.text
          ..price = priceController.text
          ..category = dropdwnItem!);
        CustomSnackBar.mySnackBar(
            context, 'New product ${titleController.text} Saved in DB');
      }

      _clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final spacer = const SizedBox(height: 30);
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
              spacer,
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
              spacer,
              MaterialButton(
                color: Theme.of(context).backgroundColor,
                onPressed: () {
                  _saveForm();
                  _clear();
                },
                child: const Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
