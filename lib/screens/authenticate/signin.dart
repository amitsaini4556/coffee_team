
import 'package:flutter/material.dart';
import 'package:coffee_team/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('SignIn'),
        centerTitle: true,
        backgroundColor: Colors.brown[400],

      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(150, 30, 150, 0),
        child: RaisedButton(
          child: Text('SignIn'),
          onPressed: () async {
            dynamic result = await _authService.SigninAnon();
            if( result == null)
              {
                print('Error in Signing');
              }else
                {
                  print('SignIn');
                  print(result);
                }
          },
        ),
      ),
    );
  }
}
