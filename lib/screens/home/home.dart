import 'package:coffee_team/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Hi , Amit'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout')
          ),
        ],

      ),
    );
  }
}
