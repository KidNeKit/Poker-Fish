import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart' as my_user;
import 'base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log('An Error in logInWithEmailAndPassword of AuthRepository: $e');
      rethrow;
    }
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        my_user.User user = my_user.User(
            id: value.user!.uid, username: value.user!.uid, email: email);
        _firestore.collection('users').doc(value.user!.uid).set(user.toMap());
      });
    } catch (e) {
      log('An Error in signUp of AuthRepository: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log('An Error in signOut of AuthRepository: $e');
    }
  }

  @override
  Future<my_user.User?> getUserById(String userId) async {
    var userData = await _firestore.collection('users').doc(userId).get();
    if (userData.exists) {
      return my_user.User.fromJson(userData.data()!);
    }
    return null;
  }
}
