import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetme/models/user.dart';
import 'package:meetme/screens/login_screen.dart';
import 'package:meetme/services/networking.dart';
import 'package:meetme/constants.dart';
import 'package:meetme/components/rounded_button.dart';
import 'package:string_validator/string_validator.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  double rating = 1;
  bool showSpinner = false;

  Future<User> _futureUser;

  NetworkHelper networkHelper = NetworkHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          alignment: Alignment.center,
          child: (_futureUser == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    TextField(
                      textAlign: TextAlign.center,
                      controller: _controllerName,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your name',
                          prefixIcon: Icon(Icons.face)),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: _controllerPassword,
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.vpn_key)),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: _controllerEmail,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.alternate_email)),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Pick your age',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 17.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Slider(
                      value: rating,
                      onChanged: (newrating) {
                        setState(() => rating = newrating);
                      },
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: "$rating",
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    RoundedButton(
                      title: 'Register',
                      colour: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          _futureUser = networkHelper.createUser(
                              _controllerName.text,
                              _controllerPassword.text,
                              _controllerEmail.text,
                              rating.toString());
                        });
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
                                builder: (context) => LoginScreen()),
                          );
                        });
                      }

                      run();
//                        return Text('Mri9el!');
                    } else if (snapshot.hasError) {
                      print("${snapshot.error}");

                      return AlertDialog(
                        title: Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        ),
                        content: Text('Please check your infos.'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterScreen.id);
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
    );
  }
}
