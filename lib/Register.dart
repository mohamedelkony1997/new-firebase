import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/HomePage.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _passwordVisible = true;
  final _formkey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text(
            "register",
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: username,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill your username input";
              }
            },
          ),
          TextFormField(
            obscureText: !_passwordVisible,
            keyboardType: TextInputType.text,
            controller: password,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              hintText: 'pasword',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill your username input";
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              var res = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: username.text, password: password.text);
              create();

              Navigator.pushNamed(context, "/");
            },
            child: Text(
              "register",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ]),
      ),
    );
  }

  Future create() async {
    final usersinfo = FirebaseFirestore.instance.collection("users");
    final docref = usersinfo.doc("email_info");
    await docref.set({"name": username.text, "password": password.text});
  }
}
