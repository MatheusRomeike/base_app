import 'package:base_app/core/authentication/firebase_helper.dart';
import 'package:base_app/core/entities/request.dart';
import 'package:base_app/core/navigator/app_navigator_interface.dart';
import 'package:base_app/core/state/scaffold_app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';

// App native classes
@GenerateMocks([
  AppNavigatorInterface,
])

// Firebase
@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
  QuerySnapshot,
  FirebaseHelper,
  FirebaseAuth,
])

// Google
@GenerateMocks([
  GoogleSignInAuthentication,
  GoogleSignIn,
  GoogleSignInAccount,
  UserCredential,
])

// Entities
@GenerateMocks([
  AppRequest,
  User,
])

// Controller
@GenerateMocks([
  ScaffoldAppState,
])
void main() {}
