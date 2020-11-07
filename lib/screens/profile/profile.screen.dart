import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodate/globals.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final displayNameController =
      TextEditingController(text: ff.user.displayName);
  final birthdayController =
      TextEditingController(text: ff.userData['birthday']);

  bool loader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원정보 수정'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: displayNameController,
          ),
          TextFormField(
            controller: birthdayController,
          ),
          RaisedButton(
            onPressed: () async {
              setState(() => loader = true);
              try {
                await ff.updateProfile({
                  'displayName': displayNameController.text,
                  'birthday': birthdayController.text,
                });
                Get.snackbar('회원 정보 수정', '회원 정보가 올바로 수정되었습니다.');
              } catch (e) {
                Get.snackbar('Error', e.toString());
              } finally {
                setState(() => loader = false);
              }
            },
            child: loader ? CircularProgressIndicator() : Text('회원 정보 수정'),
          ),
        ],
      ),
    );
  }
}
