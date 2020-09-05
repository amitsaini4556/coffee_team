import 'package:flutter/material.dart';
import 'package:coffee_team/models/customer.dart';

class CustomerTile extends StatelessWidget {
  final Customer customer ;
  CustomerTile({ this.customer});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.brown,
            child: CircleAvatar(
              radius:25.0 ,
            backgroundColor: Colors.brown[customer.strength],
            )
          ),
          title: Text(
              customer.name,
            style: TextStyle(
              letterSpacing: 1.0,
            ),
          ),
          subtitle: Text('Takes ${customer.sugars} sugar(s) '),
        ),
      ),
    );
  }
}
