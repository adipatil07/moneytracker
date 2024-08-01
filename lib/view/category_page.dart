import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String selectedType = 'Expense'; // Default type
  String selectedMonth = 'July'; // Default month
  final List<String> categories = [
    'Food',
    'Transport',
    'Entertainment',
    'Utilities',
  ];
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  void _toggleType(String type) {
    setState(() {
      selectedType = type;
    });
  }

  void _addCategory(String category) {
    setState(() {
      categories.add(category);
    });
  }

  void _deleteCategory(String category) {
    setState(() {
      categories.remove(category);
    });
  }

  void _showAddCategoryDialog({String? existingCategory}) {
    TextEditingController categoryController = TextEditingController();
    if (existingCategory != null) {
      categoryController.text = existingCategory;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: ColorsUtility.faintBgColor,
          title: Text(existingCategory == null ? 'Add Category' : 'Edit Category',
              style: StyleUtility.appBarTextStyle.copyWith(color: Colors.black)),
          content: Card(
            child: TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                labelText: 'Category Name',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (categoryController.text.isNotEmpty) {
                  if (existingCategory == null) {
                    _addCategory(categoryController.text);
                  } else {
                    _deleteCategory(existingCategory);
                    _addCategory(categoryController.text);
                  }
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsUtility.primaryColor,
              ),
              child: Text(existingCategory == null ? 'Add' : 'Update',
                  style: StyleUtility.buttonTextStyle.copyWith(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel', style: StyleUtility.normalTextStyle),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = _isSearching
        ? categories
        .where((category) => category.toLowerCase().contains(_searchController.text.toLowerCase()))
        .toList()
        : categories;

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: StyleUtility.appBarTextStyle),
        backgroundColor: ColorsUtility.primaryColor,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ToggleButtons(
                      isSelected: [
                        selectedType == 'Expense',
                        selectedType == 'Income',
                      ],
                      onPressed: (index) {
                        _toggleType(index == 0 ? 'Expense' : 'Income');
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderColor: ColorsUtility.primaryColor,
                      selectedBorderColor: ColorsUtility.primaryColor,
                      fillColor: ColorsUtility.faintBgColor,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('Expense', style: StyleUtility.mediumTextStyle),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('Income', style: StyleUtility.mediumTextStyle),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search categories',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredCategories.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(filteredCategories[index]),
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            _deleteCategory(filteredCategories[index]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${filteredCategories[index]} deleted'),
                              ),
                            );
                          }
                          if (direction == DismissDirection.startToEnd) {
                            _showAddCategoryDialog(existingCategory: filteredCategories[index]);
                          }
                        },
                        background: Container(
                          color: Colors.green,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.edit, color: Colors.white),
                        ),
                        secondaryBackground: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(filteredCategories[index],
                                style: StyleUtility.mediumTextStyle),
                            onTap: () {
                              // Handle category tap if needed
                            },
                          ),
                        ),

                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              tooltip: "Add New Category",
              foregroundColor: Colors.white,
              backgroundColor: ColorsUtility.darkBgColor,
              onPressed: () {
                _showAddCategoryDialog();
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
