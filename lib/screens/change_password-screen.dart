import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetme/components/app_bar.dart';
import 'package:meetme/components/rounded_button.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/services/networking.dart';

import 'account_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String id = 'change_password_screen';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  Future<User> futureUser;
  NetworkHelper networkHelper = NetworkHelper();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureUser = networkHelper.fetchUser();
  }

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
                              child: Icon(Icons.vpn_key),
                            ),
                          ),
                          TextSpan(
                              text: 'Password',
                              style: TextStyle(fontSize: 25.0)),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                    hintText: '********',
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
                              child: Text('Password changed with success.'),
                            ),
                          ],
                        ),
                      ),
                    );
                    setState(() {
                      futureUser = networkHelper
                          .changePassword(_controllerPassword.text);
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
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
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
