import 'dart:io';

import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:meetme/models/message.dart';
import 'dart:convert';
import 'package:meetme/models/user.dart';

class Locations {
  double latitude;
  double longitude;
  String message;
  String from;
  String receiver;
  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZWY5YzY5YjI1MzNkZDFhMDFhYWFlNmEiLCJpYXQiOjE1OTM1NDc0Njh9.3wr53ztx2W5Emtp25YmKiCZxgMOzzLqrRFtIz-EOz-Q';
  final String url = 'http://192.168.43.17:3000/locations';

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<Message> sendLocation(String message, String receiver, double latitude,
      double longitude) async {
    final http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
        body: jsonEncode(
          <dynamic, dynamic>{
            'message': message,
            'receiver': receiver,
            'latitude': latitude,
            'longitude': longitude,
          },
        ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Message.fromJson(json.decode(response.body));
    } else {
      print('failed');
      throw Exception('Failed to send message');
    }
  }

  Future<List<Message>> fetchMessage() async {
    final response = await http.get(
      url + '/me',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((msg) => new Message.fromJson(msg)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load message');
    }
  }
}
