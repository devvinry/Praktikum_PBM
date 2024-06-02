// main.dart
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/activity_input.dart';
import 'pages/child_input.dart';
import 'pages/child_activities.dart';
import 'pages/login_selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Care App',

      initialRoute: '/',
      routes: {
        '/': (context) => LoginSelectionPage(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/home_caregiver': (context) => ActivityInputPage(),
        '/home_parent': (context) => ChildInputPage(),
        '/child_activities': (context) => ChildActivitiesPage(          
          childName: '',
          childAge: 0,
          ),
      },
    );
  }
}
