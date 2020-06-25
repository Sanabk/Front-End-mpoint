import 'package:flutter/material.dart';
import 'package:meetme/screens/change_email_screen.dart';
import 'package:meetme/screens/change_name_screen.dart';
import 'package:meetme/screens/change_password-screen.dart';
import 'package:meetme/screens/current_location_screen.dart';
import 'package:meetme/screens/home_screen.dart';
import 'package:meetme/screens/manage_account_screen.dart';
import 'package:meetme/screens/personal_infos_screen.dart';
import 'package:meetme/screens/security_login_screen.dart';
import 'package:meetme/screens/send_location_screen.dart';
import 'package:meetme/screens/welcome_screen.dart';
import 'package:meetme/screens/login_screen.dart';
import 'package:meetme/screens/register_screen.dart';
import 'package:meetme/screens/account_screen.dart';

void main() => runApp(MeetMe());

class MeetMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        CurrentLocationScreen.id: (context) => CurrentLocationScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        AccountScreen.id: (context) => AccountScreen(),
        ManageAccount.id: (context) => ManageAccount(),
        PersonalInformation.id: (context) => PersonalInformation(),
        ChangeNameScreen.id: (context) => ChangeNameScreen(),
        ChangeEmailScreen.id: (context) => ChangeEmailScreen(),
        SecurityLoginScreen.id: (context) => SecurityLoginScreen(),
        ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        SendLocationScreen.id: (context) => SendLocationScreen(),
      },
    );
  }
}
