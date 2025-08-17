import 'package:agriexpert/provider/user_provider.dart';
import 'package:agriexpert/screen/Question_search2.dart';
import 'package:agriexpert/screen/Register2.dart';
import 'package:agriexpert/screen/bottom_nav_bar.dart';
import 'package:agriexpert/screen/connection_lost.dart';
import 'package:agriexpert/screen/four_zero_four.dart';
import 'package:agriexpert/screen/no_internet.dart';
import 'package:agriexpert/screen/no_data_found.dart';
import 'package:agriexpert/screen/question.dart';
import 'package:agriexpert/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()), // ✅ provide UserProvider globally
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: splash_screen(),
      //bottomnavbar(),
      //connection_lost()


    );
  }
}

