import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool  _passwordVisible = true;
  final _formkey = GlobalKey<FormState>();

  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  void initState() {
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Login",style: TextStyle(
              fontSize: 40,
              color: Colors.black,
            ),),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: username,
              decoration: InputDecoration(
              hintText: 'Email',
            ),
              validator:(value) {
                if(value!.isEmpty){
                  return"please fill your username input";
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
                    _passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
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
              validator:(value) {
                if(value!.isEmpty){
                  return"please fill your password input";
                }
              },


            ),
            SizedBox(height: 10,),
            ElevatedButton(

              onPressed: ()async {
                  var res=await FirebaseAuth.instance.signInWithEmailAndPassword(email: username.text, password: password.text);

                     if(res!=null){
                       print("welcome");
                       Navigator.pushNamed(context, "/dash");

                     }else {
                       print("user not find ");
                     }



              }
              , child: Text("login",style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            ),),
            style:ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.indigo,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12)),

            ),

            ),
          ],
          
        ),
      ),
    );
  }
}
