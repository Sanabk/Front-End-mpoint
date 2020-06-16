import 'package:flutter/material.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/services/location.dart';
import 'package:meetme/screens/account_screen.dart';

class CurrentLocationScreen extends StatefulWidget {
  static const String id = 'location_screen';

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
