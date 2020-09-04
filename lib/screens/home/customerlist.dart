import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {

  @override
  Widget build(BuildContext context) {
    final customers = Provider.of<QuerySnapshot>(context);
    for(var customer in customers.documents)
    {
        print(customer.data);
    }
    return Container();
  }
}
