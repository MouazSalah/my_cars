import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_app.dart';
import 'package:intl/intl.dart';
import 'data/shared_pref.dart';
import 'fcm_services.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  //getFormatedNumber(123456);

  await SharedPref.initialize();

  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAPi().initNotifications();
  
  runApp(const BaseApp());
}

  void getFormatedNumber(int value) {

    final formatter = NumberFormat("###,###,###", 'en_US');
    String formattedNumber = formatter.format(value);

    print("number = $formattedNumber");
  }