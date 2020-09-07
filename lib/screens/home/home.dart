import 'package:coffee_team/models/customer.dart';
import 'package:coffee_team/services/auth.dart';
import 'package:coffee_team/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_team/screens/home/customerlist.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showBottomSetting (){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
          child: Text('Something here'),
        );
      });
    }
    return StreamProvider<List<Customer>>.value(
      value: DataBase().customers,
      child: Scaffold(
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
            FlatButton.icon(
                onPressed: () => _showBottomSetting(),
                icon: Icon(Icons.settings),
                label: Text('settings'),
            )
          ],

        ),
        body: CustomerList(),
      ),
    );
  }
}
