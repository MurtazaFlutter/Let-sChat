import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lets_chat/models/service_response.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ServiceResponse> registerUser(
      {required String username,
      required email,
      required String password}) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set({'username': username, password: email});
      return ServiceResponse.fromJson(
          {'status': true, "message": "success", "data": credential.user});
    } on FirebaseAuthException catch (e) {
      return ServiceResponse.fromJson(
        {"status": false, "message": e.message.toString()},
      );
    } on Exception catch (e) {
      return ServiceResponse.fromJson(
        {"status": false, "message": e.toString()},
      );
    }
  }

  Future<ServiceResponse> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return ServiceResponse.fromJson(
          {'status': true, "message": "success", "data": credential.user});
    } on FirebaseAuthException catch (e) {
      return ServiceResponse.fromJson(
        {"status": false, "message": e.message.toString()},
      );
    } on Exception catch (e) {
      return ServiceResponse.fromJson(
        {"status": false, "message": e.toString()},
      );
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
