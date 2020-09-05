import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_team/models/customer.dart';
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
  //customers list
  List<Customer> _customerFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((customer) {
      return Customer(
        name: customer.data['name'],
        sugars: customer.data['sugars'],
        strength: customer.data['strength']
      );
    }).toList();
  }
  Stream<List<Customer>> get customers {
    return _customer.snapshots()
        .map( _customerFromSnapshot);
  }
}