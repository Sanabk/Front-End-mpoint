import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/screens/welcome_screen.dart';
import 'package:meetme/services/networking.dart';
import 'account_screen.dart';

class ManageAccount extends StatefulWidget {
  static const String id = 'manage_account';

  @override
  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  Future<User> _futureUser;

  NetworkHelper networkHelper = NetworkHelper();
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
        // change the body to future with condition to get the
        // information of the current user

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: (_futureUser == null)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/face.png'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "sana boukhriss",
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
                        'See your profile',
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
                          onPressed: () {},
                          icon: Icon(Icons.help_outline),
                          label: Text(
                            "Help & Support",
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
                          "Questions you may have",
                          style: TextStyle(
                              fontSize: 12.0,
                              letterSpacing: 2.5,
                              color: Colors.grey[500],
                              fontFamily: 'SourceSansPro,'),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: FlatButton.icon(
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(context, AccountScreen.id);
                            });
                          },
                          icon: Icon(Icons.security),
                          label: Text(
                            "Security & Privacy ",
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
                          "Update your Information",
                          style: TextStyle(
                              fontSize: 12.0,
                              letterSpacing: 2.5,
                              color: Colors.grey[500],
                              fontFamily: 'SourceSansPro,'),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: FlatButton.icon(
                          onPressed: () {
                            setState(() {
                              _futureUser = networkHelper.logout();
                            });
                          },
                          icon: Icon(Icons.exit_to_app),
                          label: Text(
                            "Log Out",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontFamily: 'SourceSansPro',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : FutureBuilder<User>(
                    future: _futureUser,
                    builder: (context, AsyncSnapshot<User> snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data);
                        @override
                        void run() {
                          scheduleMicrotask(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()),
                            );
                          });
                        }

                        run();
                        //return Text('logged in successfully!');
                      } else if (snapshot.hasError) {
                        return AlertDialog(
                          title: Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          ),
                          content: Text('Network Error'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new ManageAccount()));
                              },
                            ),
                          ],
                          elevation: 22.0,
                        );
                      }

                      return CircularProgressIndicator();
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
