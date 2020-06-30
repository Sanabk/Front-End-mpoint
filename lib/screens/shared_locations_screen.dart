import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetme/components/app_bar.dart';
import 'package:meetme/components/rounded_button.dart';
import 'package:meetme/models/message.dart';
import 'package:meetme/services/locations.dart';

class SharedLocationsScreen extends StatefulWidget {
  static const String id = 'shared_location_screen';

  @override
  _SharedLocationsScreenState createState() => _SharedLocationsScreenState();
}

class _SharedLocationsScreenState extends State<SharedLocationsScreen> {
  Locations location = new Locations();
  Future<List<Message>> _futureLocation;
  var messages = new List<Message>();

  @override
  void initState() {
    super.initState();
    location.fetchMessage();
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(
              data[index].from, data[index].message, Icons.location_on);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 50,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: kAppBar(),
        body: Center(
          child: FutureBuilder<List<Message>>(
            future: location.fetchMessage(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Message> data = snapshot.data;
                print(data);
                return _jobsListView(data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
