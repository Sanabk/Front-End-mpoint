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
//                        Navigator.pushNamed(context, ChangeNameScreen.id);
                      });
                    },
                    icon: Icon(Icons.face),
                    label: Text(
                      "Name",
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
                    "Change your name",
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
//                        Navigator.pushNamed(context, ChangeEmailScreen.id);
                      });
                    },
                    icon: Icon(Icons.alternate_email),
                    label: Text(
                      "Email",
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
                    "Change your email",
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
