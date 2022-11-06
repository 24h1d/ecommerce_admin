import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_admin/models/product_model.dart';
import 'package:ecom_admin/providers/product_provider.dart';
import 'package:ecom_admin/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String routeName = '/productdetails';
  ProductDetailsPage({Key? key}) : super(key: key);
  late ProductModel productModel;
  late ProductProvider productProvider;
  @override
  Widget build(BuildContext context) {
    productModel = ModalRoute.of(context)!.settings.arguments as ProductModel;
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.productName),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            imageUrl: productModel.thumbnailImageUrl,
            height: 200,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Text('Re-Purchase'),
              ),
              OutlinedButton(
                onPressed: () {
                  _showPurchaseHistory(context, productModel);
                },
                child: Text('Purchase History'),
              )
            ],
          )
        ],
      ),
    );
  }

  void _showPurchaseHistory(BuildContext context, ProductModel productModel) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FutureBuilder(
          future:
              productProvider.getPurchaseByProductId(productModel.productId!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final purchaseList = snapshot.data;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 5,
                              width: 50,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: purchaseList!.length,
                      itemBuilder: (context, index) {
                        final purchaseModel = purchaseList[index];
                        return ListTile(
                          title: Text(getFormattedDate(
                              purchaseModel.dateModel.timestamp.toDate())),
                          subtitle: Text('BDT ${purchaseModel.purchasePrice}'),
                          trailing: Text(
                              'Quantity: ${purchaseModel.purchaseQuantity}'),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            }
            return const Center(
              child: Text('Loading'),
            );
          },
        );
      },
    );
  }
}
