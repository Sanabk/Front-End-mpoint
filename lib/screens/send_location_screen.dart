import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetme/components/rounded_button.dart';

import '../constants.dart';
import 'account_screen.dart';

class SendLocationScreen extends StatefulWidget {
  static const String id = 'send_location_screen';

  @override
  _SendLocationScreenState createState() => _SendLocationScreenState();
}

class _SendLocationScreenState extends State<SendLocationScreen> {
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "New Message",
                      style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Recipient',
                      prefixIcon: Icon(Icons.forward),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      prefixIcon: Icon(Icons.note),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {});
          },
          label: Text('Send Location'),
          icon: Icon(Icons.send),
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
