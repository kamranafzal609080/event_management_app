import 'package:firebase_auth/firebase_auth.dart';
import 'package:event_management_app/services/auth_service.dart';
import 'package:event_management_app/services/firestore_service.dart';

class AuthController {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  // Signup
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {

    UserCredential userCredential = await _authService.signUp(
      email: email,
      password: password,
    );

    await _firestoreService.saveUser(
      uid: userCredential.user!.uid,
      email: email,
      name: "New User",
      role: "user",
    );

    return userCredential;
  }

  // Login
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _authService.login(
      email: email,
      password: password,
    );
  }

  // Logout
  Future<void> logout() async {
    await _authService.logout();
  }
}