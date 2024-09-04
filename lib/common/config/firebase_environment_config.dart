import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:someday/firebase_options.dart';
import 'dart:io';

enum Environment{ local, prod }

class FirebaseEnvironmentConfig {
  static const Environment _currentEnvironment = Environment.local;

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (_currentEnvironment == Environment.local) {
      _configureInstance();
    }
  }

  static void _configureInstance() {
    final host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    const authPort = 9099;
    const storePort = 8080;
    const storagePort = 9199;

    FirebaseAuth.instance.useAuthEmulator(host, authPort);
    FirebaseStorage.instance.useStorageEmulator(host, storagePort);
    FirebaseFirestore.instance.useFirestoreEmulator(host, storePort);
  }
}