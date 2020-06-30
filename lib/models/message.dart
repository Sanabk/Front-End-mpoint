import 'package:meetme/models/user.dart';

class Message {
  String message, receiver, from;
  double latitude, longitude;

  Message(
      {this.message, this.receiver, this.latitude, this.longitude, this.from});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'],
      receiver: json['receiver'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      from: json['from'],
    );
  }
}
