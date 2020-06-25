import 'package:flutter/material.dart';
import 'package:meetme/screens/change_email_screen.dart';

import 'account_screen.dart';
import 'change_name_screen.dart';

class PersonalInformation extends StatefulWidget {
  static const String id = 'personal_info_screen';

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
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
                    "Personal Informations",
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
                        Navigator.pushNamed(context, ChangeNameScreen.id);
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
                        Navigator.pushNamed(context, ChangeEmailScreen.id);
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
