import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/screens/change_password-screen.dart';
import 'package:meetme/screens/welcome_screen.dart';
import 'package:meetme/services/networking.dart';

import 'account_screen.dart';

class SecurityLoginScreen extends StatefulWidget {
  static const String id = 'security_login_screen';

  @override
  _SecurityLoginScreenState createState() => _SecurityLoginScreenState();
}

class _SecurityLoginScreenState extends State<SecurityLoginScreen> {
  Future<User> _futureUser;

  NetworkHelper networkHelper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Orbit'),
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: const Icon(Icons.account_circle),
                tooltip: 'My Account',
                onPressed: () {
                  Navigator.pushNamed(context, AccountScreen.id);
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Security & Login",
                    style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 18.0,
                  width: 350.0,
                  child: Divider(
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'General',
                    style: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 2.5,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, ChangePasswordScreen.id);
                      });
                    },
                    icon: Icon(Icons.vpn_key),
                    label: Text(
                      "Password",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(-0.75, -0.75),
                  child: Text(
                    "Change your password",
                    style: TextStyle(
                        fontSize: 12.0,
                        letterSpacing: 2.5,
                        color: Colors.grey[500],
                        fontFamily: 'SourceSansPro,'),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        _futureUser = networkHelper.logoutAll();
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      });
                    },
                    icon: Icon(Icons.exit_to_app),
                    label: Text(
                      "Log Out All",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(-0.75, -0.75),
                  child: Text(
                    "Log out of all devices",
                    style: TextStyle(
                        fontSize: 12.0,
                        letterSpacing: 2.5,
                        color: Colors.grey[500],
                        fontFamily: 'SourceSansPro,'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
