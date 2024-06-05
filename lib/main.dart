import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newpoll/createaccountsss.dart';
import 'package:newpoll/profilepages.dart';
import 'package:newpoll/secondpagegetstartedsss.dart';
import 'package:newpoll/tapbarsss.dart';
import 'package:newpoll/thoughtsss.dart';

import 'Createnewpass.dart';
import 'Loginnn.dart';
import 'OTPphone.dart';
import 'colorss.dart';
import 'commentss.dart';
import 'firstpagesss.dart';
import 'forgotmobile.dart';
import 'homesss.dart';
import 'otp_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(

  apiKey: "AIzaSyDyIc1kOD4qLQeTrSmaXhCAYU2qEASSGVE",
  authDomain: "polling-ad547.firebaseapp.com",
  projectId: "polling-ad547",
  storageBucket: "polling-ad547.appspot.com",
  messagingSenderId: "751099867980",
  appId: "1:751099867980:web:db7e4698566e0d804415e9"
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: myTheme,
      home: enter(),
    );
  }
}
