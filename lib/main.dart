import 'package:bhakti_sagar/pages/auto_login_page.dart';
import 'package:bhakti_sagar/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: "Bhakti Sagar",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: AutoLoginPage(),
    ),
  );
}
