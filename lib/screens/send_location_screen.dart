import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetme/components/app_bar.dart';
import 'package:meetme/components/rounded_button.dart';
import 'package:meetme/models/message.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/services//locations.dart';
import 'package:meetme/services/networking.dart';

import '../constants.dart';
import 'account_screen.dart';

class SendLocationScreen extends StatefulWidget {
  static const String id = 'send_location_screen';

  @override
  _SendLocationScreenState createState() => _SendLocationScreenState();
}

class _SendLocationScreenState extends State<SendLocationScreen> {
  final TextEditingController _controllerMessage = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  Future<User> futureUser;
  NetworkHelper networkHelper = NetworkHelper();
  Locations location = Locations();

  double latitude;
  double longitude;
  Future<Message> _futurelocation;
  User sn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void ap() {
    FutureBuilder(
        future: futureUser,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
            sn = snapshot.data;
          }
        });
  }

  void getLocation() async {
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: kAppBar(),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
                    controller: _controllerEmail,
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
                    controller: _controllerMessage,
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
        floatingActionButton: FutureBuilder<Message>(
            future: _futurelocation,
            builder: (context, snapshot) {
              return FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    _futurelocation = location.sendLocation(
                        _controllerMessage.text,
                        _controllerEmail.text,
                        latitude,
                        longitude);
                  });
                },
                label: Text('Send Location'),
                icon: Icon(Icons.send),
                backgroundColor: Colors.lightBlueAccent,
              );
            }),
      ),
    );
  }
}
