// ignore_for_file: unused_field, prefer_final_fields

import 'package:boutique/models/category.dart';
import 'package:boutique/providers/isar_services.dart';
import 'package:boutique/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AddCategoryScreen extends StatefulWidget {
  static const routeName = '/add-category';
  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final titleController = TextEditingController();
  var _isInit = true;
  void _clear() {
    titleController.text = '';
  }

  var verifierId;
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (verifierId != null) {
        print('UPDATE');
      } else {
        print('ADDjjj');
        Provider.of<IsarServices>(context, listen: false)
            .saveCategory(Category()..title = titleController.text);
        CustomSnackBar.mySnackBar(
            context, 'New category ${titleController.text} Saved in DB');
      }

      _clear();
      Navigator.of(context).pop();
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      print('helllo');
      final categoryId = ModalRoute.of(context)!.settings.arguments;
      print('helllo$categoryId');
      if (categoryId != null) {
        final foundCategory = Provider.of<IsarServices>(context, listen: false)
            .findById(categoryId);
        verifierId = foundCategory.id.toString();
        titleController.text = foundCategory.title;
        print('category:${foundCategory.title}');
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Category')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      //initialValue: _initValues['title'],
                      controller: titleController,
                      decoration: const InputDecoration(label: Text('Title')),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Category Title is not allowed to be empty';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                _saveForm();
              },
              child: const Text('Save'),
              color: Theme.of(context).backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
