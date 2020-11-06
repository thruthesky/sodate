import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodate/globals.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final displayNameController = TextEditingController();
  final birthdayController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Email address'),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          TextFormField(
            controller: displayNameController,
            decoration: InputDecoration(hintText: 'Display name'),
          ),
          TextFormField(
            controller: birthdayController,
            decoration: InputDecoration(hintText: 'Birthday'),
          ),
          RaisedButton(
            onPressed: () async {
              setState(() => loading = true);
              try {
                await ff.register({
                  'email': emailController.text,
                  'password': passwordController.text,
                  'displayName': displayNameController.text,
                  'birthday': birthdayController.text,
                }, meta: {
                  'public': {
                    'a': 'b',
                  }
                });
                Get.toNamed('home');
              } catch (e) {
                print(e.toString());
                Get.snackbar('Error', e.toString());
              } finally {
                setState(() => loading = false);
              }
            },
            child: loading ? CircularProgressIndicator() : Text('Submit'),
          ),
        ],
      ),
    );
  }
}
