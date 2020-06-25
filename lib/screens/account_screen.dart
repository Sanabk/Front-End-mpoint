import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetme/screens/personal_infos_screen.dart';
import 'package:meetme/screens/security_login_screen.dart';

class AccountScreen extends StatefulWidget {
  static const String id = 'account_screen';

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Orbit'),
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
                    "Account Setting",
                    style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 30.0,
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Manage informations about you and your account in general',
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 2.5,
                      color: Colors.grey[500],
                      fontFamily: 'SourceSansPro,'),
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
                  child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, PersonalInformation.id);
                      });
                    },
                    icon: Icon(Icons.account_circle),
                    label: Text(
                      "Personal Informations",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(-0.75, -0.75),
                  child: Text(
                    "Update your name & email",
                    style: TextStyle(
                        fontSize: 12.0,
                        letterSpacing: 2.5,
                        color: Colors.grey[500],
                        fontFamily: 'SourceSansPro,'),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                  width: 350.0,
                  child: Divider(
                    color: Colors.grey.shade200,
                    thickness: 10.0,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Security",
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 3,
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Manage informations about you and your account in general',
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 2.5,
                      color: Colors.grey[500],
                      fontFamily: 'SourceSansPro,'),
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
                  child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, SecurityLoginScreen.id);
                      });
                    },
                    icon: Icon(Icons.security),
                    label: Text(
                      "Security and Login",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontFamily: 'SourceSansPro',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
