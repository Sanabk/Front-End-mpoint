import 'package:flutter/material.dart';
import 'package:meetme/components/rounded_button.dart';
import 'package:meetme/constants.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/screens/current_location_screen.dart';
import 'package:meetme/services/networking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  Future<User> _futureUser;

  NetworkHelper networkHelper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            alignment: Alignment.center,
            child: (_futureUser == null)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Flexible(
                        child: Hero(
                          tag: 'logo',
                          child: Container(
                            height: 150.0,
                            child: Image.asset('images/logo.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          controller: _controllerEmail,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter your email',
                              prefixIcon: Icon(Icons.alternate_email))),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        controller: _controllerPassword,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password',
                            prefixIcon: Icon(Icons.vpn_key)),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      RoundedButton(
                        title: 'Log In',
                        colour: Colors.lightBlueAccent,
                        onPressed: () {
                          setState(() {
                            _futureUser = networkHelper.authenticate(
                                _controllerPassword.text,
                                _controllerEmail.text);
                          });

//                          Navigator.pushNamed(
//                              context, CurrentLocationScreen.id);
                        },
                      ),
                    ],
                  )
                : FutureBuilder<User>(
                    future: _futureUser,
                    builder: (context, AsyncSnapshot<User> snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data);
                        @override
                        void run() {
                          scheduleMicrotask(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CurrentLocationScreen()),
                            );
                          });
                        }

                        run();
                        //return Text('logged in successfully!');
                      } else if (snapshot.hasError) {
                        return AlertDialog(
                          title: Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          ),
                          content: Text('Incorrect email address or password.'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.pushNamed(context, LoginScreen.id);
                              },
                            ),
                          ],
                          elevation: 22.0,
                        );
                      }

                      return CircularProgressIndicator();
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
