import 'package:flutter/material.dart';
import 'package:coffee_team/services/auth.dart';
import 'package:coffee_team/sharedData/contants.dart';
import 'package:coffee_team/sharedData/loading.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register( { this.toggleview });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  String name = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading  ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('SignUp to Coffee Cafe'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('SignIn'),
            onPressed: () {
              widget.toggleview();
            },
          )
        ],

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Name'),
                  validator: (val) => val.isEmpty ? 'Enter your name ' : null,
                  onChanged: (val){
                    setState(() => name = val);
                  },
                ),
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
                    if(_formkey.currentState.validate())
                      {
                        setState(() => loading = true );
                        dynamic result = await _auth.registerEmailandPassword(email,password,name);
                        if(result == null)
                          {
                            setState(() {
                              error = '*Please supply a valid email.';
                              loading = false;
                            });
                          }
                      }
                  },
                  color: Colors.brown[400],
                  child: Text(
                    'Register',
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
      ),
    );
  }
}
