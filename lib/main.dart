import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sodate/globals.dart';
import 'package:sodate/screens/home/home.screen.dart';
import 'package:sodate/screens/login/login.screen.dart';
import 'package:sodate/screens/profile/profile.screen.dart';
import 'package:sodate/screens/register/register.screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ff.init();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sodate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      getPages: [
        GetPage(name: 'home', page: () => HomeScreen()),
        GetPage(name: 'register', page: () => RegisterScreen()),
        GetPage(name: 'login', page: () => LoginScreen()),
        GetPage(name: 'profile', page: () => ProfileScreen()),
      ],
    );
  }
}
