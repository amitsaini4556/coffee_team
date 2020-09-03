import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  final _customer = Firestore.instance.collection('customers');
}