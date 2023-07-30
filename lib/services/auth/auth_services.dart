import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
//instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance of firestore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

//signin method
  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
     //signin
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email,
           password: password
           );
  //add a new user for the user in users collection if it doesn't already exists
    _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid':userCredential.user!.uid,
        'email':email,
      },SetOptions(merge: true)
      );
      return userCredential;
    }
    //cath any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //create new User
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // after creating new user,create a new document for user in the users collection

      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid':userCredential.user!.uid,
        'email':email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//signout method
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
