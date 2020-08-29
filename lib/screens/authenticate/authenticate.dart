import 'package:coffee_team/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';
import 'package:coffee_team/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleview(){
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn)
      return SignIn(toggleview : toggleview);
    else
      return Register(toggleview :toggleview);
  }
}


