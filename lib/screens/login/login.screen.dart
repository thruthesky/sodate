import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodate/globals.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Email Address'),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          RaisedButton(
            onPressed: () async {
              setState(() => loading = true);
              try {
                await ff.login(
                  email: emailController.text,
                  password: passwordController.text,
                );
                Get.toNamed('home');
              } catch (e) {
                Get.snackbar('Error', e.toString());
              } finally {
                setState(() => loading = false);
              }
            },
            child: Text('로그인'),
          ),
        ],
      ),
    );
  }
}
