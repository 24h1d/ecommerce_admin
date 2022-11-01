import 'package:flutter/material.dart';

class OrderListPage extends StatelessWidget {
  static const String routeName = '/order_list_page';
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order List'),
      ),
    );
  }
}
