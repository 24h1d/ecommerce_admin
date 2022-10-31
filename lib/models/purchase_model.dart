import 'package:ecom_admin/models/date_model.dart';

const String collectionPurchase = 'Purchase';

class PurchaseModel {
  String? purchaseId;
  String? productId;
  num purchaseQuantity;
  num purchasePrice;
  DateModel dateModel;

  PurchaseModel(
      {this.purchaseId,
      this.productId,
      required this.purchaseQuantity,
      required this.purchasePrice,
      required this.dateModel});

  //frommap
  //tomap
}
