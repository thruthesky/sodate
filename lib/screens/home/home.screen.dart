import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../globals.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email: ${ff.user.email}'),
            Text('Email: ${ff.user.displayName}'),
            Text('Email: ${ff.userData['birthday']}'),
            RaisedButton(
              onPressed: () => Get.toNamed('register'),
              child: Text('Register'),
            )
          ],
        ),
      ),
    );
  }
}
