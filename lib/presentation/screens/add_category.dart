import 'package:boutique/models/category.dart';
import 'package:boutique/providers/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AddCategoryScreen extends StatefulWidget {
  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  final titleController = TextEditingController();
  var _isInit = true;
  bool _isLoading = false;
  void _clear() {
    titleController.text = '';
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<Categories>(context, listen: false)
          .saveCategory(Category()..title = titleController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('New category ${titleController.text} Saved in DB'),
        ),
      );
      _clear();
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Categories>(context).getCategories().then((_) {
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
    final categories = Provider.of<Categories>(context).categories;
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Category')),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                            controller: titleController,
                            decoration:
                                const InputDecoration(label: Text('Title')),
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
                  Expanded(
                    child: ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Text(categories[index].id.toString()),
                              title: Text(categories[index].title),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
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
