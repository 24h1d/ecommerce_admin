import 'package:ecom_admin/auth/auth_service.dart';
import 'package:ecom_admin/pages/launcher_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String _errMsg = '';

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                    onPressed: _authenticate, child: Text('Login as Admin')),
                Text(_errMsg),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _authenticate() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please Wait', dismissOnTap: false);
      final email = _emailController.text;
      final password = _passController.text;
      try {
        final status = await AuthService.loginAdmin(email, password);
        EasyLoading.dismiss();
        if (status) {
          if (mounted) {
            // mounted shows that login page exists on the widget tree or not
            Navigator.pushReplacementNamed(context, LauncherPage.routeName);
            setState(() {});
          }
        } else {
          AuthService.logout();
          _errMsg = 'This email is not an admin email';
          setState(() {});
        }
      } on FirebaseAuthException catch (e) {
        _errMsg = e.message!;
        setState(() {});
        EasyLoading.dismiss();
      }
    }
  }
}
