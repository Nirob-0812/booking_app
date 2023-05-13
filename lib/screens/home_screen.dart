import 'package:booking_app/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),
      backgroundColor: Colors.greenAccent,),
      body: Center(
        child: ElevatedButton(
            onPressed: () async{
              await GoogleSignIn().signOut();
              FirebaseAuth.instance.signOut().then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SignInScreen();
                }));
              });
            }, child: Text("Log Out"),
          ),
      ),
    );
  }
}
