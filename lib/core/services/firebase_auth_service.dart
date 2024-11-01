import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits/core/errors/exception.dart';
import 'package:fruits/core/services/shared_preferences_singleton.dart';
import 'package:fruits/core/utils/constants/constants.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:fruits/features/home/presentation/views/main_view.dart';
import 'package:fruits/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  /// Variables
  final _auth = FirebaseAuth.instance;

  /// Get Authenticared User Data
  User? get authUser => _auth.currentUser!;

  /// Delete User
  Future<void> deleteUser() async {
    await _auth.currentUser!.delete();
  }

  /// Function to show Relevant Screen
  screenRedirect(context) async {
    bool isOnBoardingViewSeen =
        SharedPreferencesSingleton.getBool(kIsOnBoardingViewSeen);

    if (isOnBoardingViewSeen) {
      var isLoggedIn = FirebaseAuthService().isLoggedIn();
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, MainView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, SigninView.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  }

  /// Create Method to create new user with email and password
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");

      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم من قبل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }

  /// Sign In Method with email and password
  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'كلمة المرور أو البريد الالكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'كلمة المرور أو البريد الالكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the User
    return (await _auth.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await _auth.signInWithCredential(facebookAuthCredential)).user!;
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
