import 'package:flutter/material.dart';
import 'package:meetme/components/rounded_button.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/screens/personal_infos_screen.dart';
import 'package:meetme/services/networking.dart';

import '../constants.dart';
import 'account_screen.dart';

class ChangeNameScreen extends StatefulWidget {
  static const id = 'change_name_screen';
  @override
  _ChangeNameScreenState createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {
  Future<User> futureUser;
  NetworkHelper networkHelper = NetworkHelper();
  final TextEditingController _controllername = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureUser = networkHelper.fetchUser();
  }

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
                              child: Icon(Icons.face),
                            ),
                          ),
                          TextSpan(
                              text: 'Name', style: TextStyle(fontSize: 25.0)),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _controllername,
                  decoration: InputDecoration(
                    hintText: ' ${snapshot.data.name}',
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
                              child: Text('Name changed with success.'),
                            ),
                          ],
                        ),
                      ),
                    );
                    setState(() {
                      futureUser =
                          networkHelper.changeName(_controllername.text);
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
