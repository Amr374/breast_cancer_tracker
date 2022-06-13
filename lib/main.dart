import 'package:final_app/view/blood.dart';
import 'package:final_app/view/home.dart';
import 'package:final_app/view/result.dart';
import 'package:final_app/view/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth/login.dart';
import 'view/bottomNavBar.dart';
import 'view/profile.dart';


void main()async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        routes: {
          'Blood Analysis': (context) => BloodAnalysis(),
          'Profile': (context) => ProfileScreen(),
          'App': (context) => App(),
          // 'Mammo Graphic': (context) => Mammo(),
          'Result': (context) => Result(),
          'Search': (context) => Search(),
          'Home': (context) => MyHomePage(),


        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor:  Colors.pink[50],
            // scaffoldBackgroundColor: Colors.purple[50],
            appBarTheme: AppBarTheme(
              color: Colors.purple[900] ,
              // backgroundColor: Colors.purple[900],
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.purple[900],
                statusBarIconBrightness: Brightness.dark,
              ),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,

            ),

        ),

        home: FirebaseAuth.instance.currentUser == null?Login():App(),
      );
  }
}


