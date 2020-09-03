import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {

  String uid;
  DataBase({ this.uid });

  final _customer = Firestore.instance.collection('customers');

  Future updateUserData (String sugars , String name , int strength) async {
    return await _customer.document(uid).setData({
      'sugars' : sugars,
      'name' : name,
      'strength' :strength
    });
  }
}