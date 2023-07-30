import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../data/shared_pref.dart';
import '../fcm/firebase_options.dart';
import 'base_app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  await SharedPref.initialize();

  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Firebase.initializeApp();
  FirebaseMessaging fcm = FirebaseMessaging.instance;
  fcm.requestPermission();

  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  
  runApp(const BaseApp());
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  print('A bg message just showed up:  ${message.messageId}');
}