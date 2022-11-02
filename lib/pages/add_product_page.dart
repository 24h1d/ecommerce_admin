import 'package:ecom_admin/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  static const String routeName = '/add_product';
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _shortDescriptionController = TextEditingController();
  final _longDescriptionController = TextEditingController();
  final _salePriceController = TextEditingController();
  final _discountController = TextEditingController();
  final _purchaseController = TextEditingController();
  final _quantityController = TextEditingController();

  String? category, thumbnail;
  DateTime? purchaseDate;

  @override
  void dispose() {
    // TODO: implement dispose
    _productNameController.dispose();
    _shortDescriptionController.dispose();
    _longDescriptionController.dispose();
    _salePriceController.dispose();
    _discountController.dispose();
    _purchaseController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              children: [
                Consumer<ProductProvider>(
                  builder: (context, provider, child) =>
                      DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: category,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                    items: provider.categoryList
                        .map((catModel) => DropdownMenuItem(
                            value: catModel.categoryName,
                            child: Text(catModel.categoryName)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        category = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Select Category',
                      prefixIcon: Icon(Icons.category),
                      filled: true,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _productNameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    prefixIcon: Icon(Icons.card_giftcard),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),

                // DropdownButtonFormField(items: , onChanged: onChanged),

                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _shortDescriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Short Description',
                    prefixIcon: Icon(Icons.description),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _longDescriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Long Description',
                    prefixIcon: Icon(Icons.description),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _salePriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Sale Price',
                    prefixIcon: Icon(Icons.price_change),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    if (num.parse(value) <= 0) {
                      return 'Price should be greater than 0';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _discountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Discount',
                    prefixIcon: Icon(Icons.discount),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not empty';
                    }
                    if (num.parse(value) < 0) {
                      return 'Discount should not be a negative value';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 5,
                ),
/*                TextFormField(
                  controller: _purchaseController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Purchase',
                    prefixIcon: Icon(Icons.add_box),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not empty';
                    }
                    return null;
                  },
                )*/

                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantity',
                    prefixIcon: Icon(Icons.production_quantity_limits),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(),
              ],
            )),
      ),
    );
  }
}
