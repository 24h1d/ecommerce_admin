import 'package:ecom_admin/auth/auth_service.dart';
import 'package:ecom_admin/customwidgets/dashboard_item_view.dart';
import 'package:ecom_admin/pages/launcher_page.dart';
import 'package:flutter/material.dart';

import '../models/dashboard_model.dart';

class DashboardPage extends StatelessWidget {
  static const String routeName = '/dashboard_page';
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              AuthService.logout();
              Navigator.pushReplacementNamed(context, LauncherPage.routeName);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: dashboardModelList.length,
        itemBuilder: (context, index) =>
            DashboardItemView(model: dashboardModelList[index]),
      ),
    );
  }
}
