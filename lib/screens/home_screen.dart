import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetme/components/app_bar.dart';
import 'package:meetme/components/rounded_button.dart';
import 'package:meetme/screens/current_location_screen.dart';
import 'package:meetme/screens/send_location_screen.dart';

import 'account_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: kAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedButton(
                    title: 'Check Messages',
                    colour: Colors.lightBlueAccent,
                    onPressed: () {
                      setState(() {
//                      Navigator.pushNamed(context, .id);
                      });
                    },
                  ),
                  RoundedButton(
                    title: 'Get Current Location',
                    colour: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, CurrentLocationScreen.id);
                      });
                    },
                  ),
                  RoundedButton(
                    title: 'Send Current Location',
                    colour: Colors.lightBlueAccent,
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, SendLocationScreen.id);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
