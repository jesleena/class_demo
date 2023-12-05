import 'package:flutter/material.dart';

class Shared_login extends StatefulWidget {
  @override
  State<Shared_login> createState() => _Shared_loginState();
}

class _Shared_loginState extends State<Shared_login> {
final uname_ctrl=TextEditingController();
final pwd_ctrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: uname_ctrl,

          )
        ],
      ),
    );
  }
}
