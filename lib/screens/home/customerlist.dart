import 'package:coffee_team/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_team/screens/home/customertile.dart';

class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {

  @override
  Widget build(BuildContext context) {
    final customers = Provider.of<List<Customer>>(context);
    return ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context,index){
          return CustomerTile(customer : customers[index]);
        }
    );
  }
}
