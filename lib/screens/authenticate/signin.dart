
import 'package:flutter/material.dart';
import 'package:coffee_team/services/auth.dart';
import 'package:coffee_team/sharedData/contants.dart';
import 'package:coffee_team/sharedData/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;
  SignIn( { this.toggleview });
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('SignIn to Coffee Cafe'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleview();
            },
          )
        ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    setState(() => loading = true );
                    dynamic result = await _auth.signInEmailandPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = '*could not sign in with those credentials.';
                        loading = false;
                      });
                    }
                  }
                },
                color: Colors.brown[400],
                child: Text(
                  'sign in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red,fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
