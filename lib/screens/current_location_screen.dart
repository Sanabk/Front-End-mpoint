import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/services/location.dart';
import 'package:meetme/screens/account_screen.dart';

class CurrentLocationScreen extends StatefulWidget {
  static const String id = 'location_screen';

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  double latitude = 35.7661918;
  double longitude = 10.8252182;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<dynamic> getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(35.7651213, 10.8232693),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(35.7616379, 10.8045506),
          zoom: 117,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
        trafficEnabled: true,
        compassEnabled: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Send location'),
        icon: Icon(Icons.my_location),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
