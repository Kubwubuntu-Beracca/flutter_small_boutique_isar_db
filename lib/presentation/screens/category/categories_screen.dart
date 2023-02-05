import 'package:boutique/presentation/screens/category/add_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../providers/isar_services.dart';
import '../../../widgets/show_snackbar_item.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<IsarServices>(context).getAllCategories().then((_) {
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
    final categories = Provider.of<IsarServices>(context).categories;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddCategoryScreen.routeName);
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
              child: (categories.isEmpty || categories == null)
                  ? const Center(
                      child: Text(
                        'No categories added yet',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    leading:
                                        Text(categories[index].id.toString()),
                                    title: Text(categories[index].title),
                                    trailing: SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                AddCategoryScreen.routeName,
                                                arguments: categories[index].id,
                                              );
                                              print(
                                                  'Id:${categories[index].id}');
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Consumer<IsarServices>(
                                            builder: (_, cat, ch) => IconButton(
                                              onPressed: () {
                                                print(categories[index].id);
                                                cat.deleteCategory(
                                                    categories[index].id);
                                                CustomSnackBar.mySnackBar(
                                                    context,
                                                    '${categories[index].title} category delete from DB');
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
