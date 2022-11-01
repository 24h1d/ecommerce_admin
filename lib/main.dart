import 'package:ecom_admin/pages/add_product_page.dart';
import 'package:ecom_admin/pages/category_page.dart';
import 'package:ecom_admin/pages/dashboard_page.dart';
import 'package:ecom_admin/pages/launcher_page.dart';
import 'package:ecom_admin/pages/login_page.dart';
import 'package:ecom_admin/pages/order_list_page.dart';
import 'package:ecom_admin/pages/product_details_page.dart';
import 'package:ecom_admin/pages/product_repurchase_page.dart';
import 'package:ecom_admin/pages/report_page.dart';
import 'package:ecom_admin/pages/settings_page.dart';
import 'package:ecom_admin/pages/user_list_page.dart';
import 'package:ecom_admin/pages/view_product_page.dart';
import 'package:ecom_admin/provider/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      builder: EasyLoading.init(),
      initialRoute: LauncherPage.routeName,
      routes: {
        DashboardPage.routeName: (context) => DashboardPage(),
        LoginPage.routeName: (context) => LoginPage(),
        LauncherPage.routeName: (context) => LauncherPage(),
        AddProductPage.routeName: (context) => AddProductPage(),
        ViewProductPage.routeName: (context) => ViewProductPage(),
        CategoryPage.routeName: (context) => CategoryPage(),
        OrderListPage.routeName: (context) => OrderListPage(),
        UserListPage.routeName: (context) => UserListPage(),
        SettingsPage.routeName: (context) => SettingsPage(),
        ReportPage.routeName: (context) => ReportPage(),
        ProductDetailsPage.routeName: (context) => ProductDetailsPage(),
        ProductRepurchasePage.routeName: (context) => ProductRepurchasePage(),
      },
    );
  }
}
