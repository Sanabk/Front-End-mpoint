import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meetme/models/token.dart';
import 'dart:convert';
import 'package:meetme/models/user.dart';

class NetworkHelper {
  NetworkHelper();
  final String url = 'http://192.168.43.17:3000/users';
  final String token =
      'yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZWYyMDk0ZTIyYjM5NjQ0NzYzZjllM2UiLCJpYXQiOjE1OTI5MjA0NzR9.FJsIQeSD4ynir1ZGUl1uASjDLmge6VKBCYqTSSc1HUU';
  Future<User> createUser(
      String name, String password, String email, String age) async {
    final http.Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{
            'name': name,
            'password': password,
            'email': email,
            'age': age
          },
        ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(json.decode(response.body));
    } else {
      print('failed');
      throw Exception('Failed to create user');
    }
  }

  Future<User> authenticate(String password, String email) async {
    final http.Response response = await http.post(url + '/login',
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{
            'password': password,
            'email': email,
          },
        ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(json.decode(response.body));
    } else {
      print('failed');
      throw Exception('Failed to login');
    }
  }

  Future<User> logout() async {
    final http.Response response = await http.post(url + '/logout',
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: jsonEncode(
          <String, String>{},
        ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to logout');
    }
  }

  Future<String> fetchToken() async {
    final response = await http.get(url + '/token');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return json.decode(response.body)['token'];
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load token');
    }
  }

  Future<String> getToken() async {
    var token = await fetchToken();
    return '$token';
  }
//  Future<void>  main() async {
//    print('Fetching user token...');
//    var token =  await getToken();
//    print(token);
//  }

  Future<User> fetchUser() async {
    final response = await http.get(
      url + '/me',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }

  Future<User> changeName(String name) async {
    final http.Response response = await http.patch(url + '/me',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
        body: jsonEncode(
          <String, String>{
            'name': name,
          },
        ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(json.decode(response.body));
    } else {
      print('failed');
      throw Exception('Failed to change user name');
    }
  }

  Future<User> changeEmail(String email) async {
    final http.Response response = await http.patch(url + '/me',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
        body: jsonEncode(
          <String, String>{
            'email': email,
          },
        ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(json.decode(response.body));
    } else {
      print('failed');
      throw Exception('Failed to change user email');
    }
  }

  Future<User> changePassword(String password) async {
    final http.Response response = await http.patch(url + '/me',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
        body: jsonEncode(
          <String, String>{
            'password': password,
          },
        ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(json.decode(response.body));
    } else {
      print('failed');
      throw Exception('Failed to change user password');
    }
  }

  Future<User> logoutAll() async {
    final http.Response response = await http.post(url + '/logoutAll',
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: jsonEncode(
          <String, String>{},
        ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to logout');
    }
  }
}
