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
}