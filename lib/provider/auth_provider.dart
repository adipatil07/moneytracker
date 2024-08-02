import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? _user;

  bool _isLoading = false;
  String? _errorMessage;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> signInWithEmail(String email, String password) async {
    _setLoadingState(true);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      _setErrorMessage(e.toString());
    }
    _setLoadingState(false);
  }

  Future<void> signInWithGoogle() async {
    _setLoadingState(true);
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      _setErrorMessage(e.toString());
    }
    _setLoadingState(false);
  }

  Future<void> signUpWithEmail(String email, String password) async {
    _setLoadingState(true);
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      _setErrorMessage(e.toString());
    }
    _setLoadingState(false);
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      notifyListeners();
    } catch (e) {
      _setErrorMessage(e.toString());
    }
  }

  void _onAuthStateChanged(User? user) {
    _user = user;
    notifyListeners();
  }

  void _setLoadingState(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void _setErrorMessage(String? errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }
}
