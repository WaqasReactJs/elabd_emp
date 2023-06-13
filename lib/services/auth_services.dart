import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthServiceProvider with ChangeNotifier {
  // final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  // UserModel? _userFromFirebase(auth.User? user) {
  //   if (user == null) {
  //     return null;
  //   } else {
  //     return UserModel(user.uid, user.email);
  //   }
  // }
  // Stream<UserModel?>? get user {
  //   return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  // }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;
  Future<bool> signUp(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      notifyListeners();
      return true;
    } catch (e) {
      // Handle sign-up errors
      print(e);
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      notifyListeners();
      return true; // Sign-in successful
    } catch (e) {
      // Handle sign-in errors
      print(e);
      return false; // Sign-in failed
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      _user = null;
      notifyListeners();
      return true;
    } catch (e) {
      // Handle sign-out errors
      print(e);
      return false;
    }
  }

  // Future<UserModel?> signInWithEmailAndPassword(
  //     String email, String password) async {}
  //
  // Future<UserModel?> createUserWithEmailAndPassword(
  //     String email, String password) async {}
  //
  // Future<void> signOut() async {}
}
