import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/HomePage.dart';
import 'package:flutter/material.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
   appBar: AppBar(
     title: Text("dash",
       style: TextStyle(
           color: Colors.black
       ),
     ),
     actions: [
       InkWell (
         onTap: () {
        FirebaseAuth.instance.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));

         },
         child: Icon(Icons.logout,
         size: 30,

         ),
       ),

     ],
   ),

    );
  }
}
