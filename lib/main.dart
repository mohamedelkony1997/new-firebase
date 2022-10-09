import 'package:firebaselogin/DashBoard.dart';
import 'package:flutter/material.dart';
import 'package:firebaselogin/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{

  runApp( FlutteraAp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class FlutteraAp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
    "/":(context) => HomePage(),
    "/dash":(context) => DashBoard(),
      },
    );
  }
}
