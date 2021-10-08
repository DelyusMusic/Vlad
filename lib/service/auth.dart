import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/service/user.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> singIn(String email, String password) async {
    try {
      UserCredential singResult =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = singResult.user!;
      return UserModel.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> regsitation(String email, String password) async {
    try {
      UserCredential regisResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = regisResult.user!;
      return UserModel.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future singOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<UserModel?> get currentUser {
    return _firebaseAuth.authStateChanges().map(
          (User? user) => user != null ? UserModel.fromFirebase(user) : null,
        );
  }

  showEmail() {
    String info = _firebaseAuth.currentUser!.email.toString();
    return info;
  }

  showID() {
    String id = _firebaseAuth.currentUser!.uid.toString();
    return id;
  }
}
