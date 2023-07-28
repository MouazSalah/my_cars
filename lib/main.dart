import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_app.dart';

import 'data/shared_pref.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  await SharedPref.initialize();

  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const BaseApp());
}