import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetme/components/app_bar.dart';
import 'package:meetme/components/rounded_button.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/screens/personal_infos_screen.dart';
import 'package:meetme/services/networking.dart';

import 'account_screen.dart';

class ChangeEmailScreen extends StatefulWidget {
  static const id = 'change_email_screen';

  @override
  _ChangeEmailScreenState createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  Future<User> futureUser;
  NetworkHelper networkHelper = NetworkHelper();
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureUser = networkHelper.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: kAppBar(),
        body: FutureBuilder<User>(
          future: futureUser,
          // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Container(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.body1,
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(Icons.alternate_email),
                            ),
                          ),
                          TextSpan(
                              text: 'Email', style: TextStyle(fontSize: 25.0)),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    hintText: ' ${snapshot.data.email}',
                  ),
                ),
                RoundedButton(
                  title: 'Submit Change',
                  colour: Colors.lightBlueAccent,
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: <Widget>[
                            Icon(Icons.thumb_up),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text('Email changed with success.'),
                            ),
                          ],
                        ),
                      ),
                    );
                    setState(() {
                      futureUser =
                          networkHelper.changeEmail(_controllerEmail.text);
                    });
                  },
                ),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
              ];
            } else {
              children = <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}
