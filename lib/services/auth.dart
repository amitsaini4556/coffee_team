import 'package:coffee_team/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_team/models/user.dart';
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user){
    return user !=null ? User(uid: user.uid) : null;
  }
  //create stream to map user signed in or not
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }
  // sign in Anon
  Future SigninAnon () async {
      try{
        AuthResult result = await _auth.signInAnonymously();
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);
      }catch(e){
        print(e);
        return(null);
      }
  }

  //sign in via email and password
  Future signInEmailandPassword(String email , String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //register via email and password
  Future registerEmailandPassword(String email , String password , String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      await DataBase(uid: user.uid).updateUserData('0', name , 100);
      return _userFromFirebaseUser(user);
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }

  }
}