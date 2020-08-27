import 'package:coffee_team/screens/wrapper.dart';
import 'package:coffee_team/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_team/models/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
