import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_screen.dart';

class SecurityLoginScreen extends StatefulWidget {
  static const String id = 'security_login_screen';

  @override
  _SecurityLoginScreenState createState() => _SecurityLoginScreenState();
}

class _SecurityLoginScreenState extends State<SecurityLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Meet Me'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle),
              tooltip: 'My Account',
              onPressed: () {
                Navigator.pushNamed(context, AccountScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
