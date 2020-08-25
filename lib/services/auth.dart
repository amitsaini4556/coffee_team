import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_team/models/user.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user){
    return user !=null ? User(uid: user.uid) : null;
  }
  // ignore: non_constant_identifier_names
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