import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            StreamBuilder(
                stream: ff.userChange,
                builder: (context, snapshot) {
                  if (ff.loggedIn) {
                    return Column(
                      children: [
                        Text('Uid: ${ff.user.uid}'),
                        Text('Email: ${ff.user.email}'),
                        Text('displayName: ${ff.user.displayName}'),
                        Text('Birthday: ${ff.userData['birthday']}'),
                        RaisedButton(
                            onPressed: () => Get.toNamed('profile'),
                            child: Text('회원정보 수정')),
                        RaisedButton(onPressed: ff.logout, child: Text('로그아웃')),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Text('로그인을 해 주세요.'),
                        RaisedButton(
                          onPressed: () => Get.toNamed('register'),
                          child: Text('회원가입'),
                        ),
                        RaisedButton(
                          onPressed: () => Get.toNamed('login'),
                          child: Text('로그인'),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
