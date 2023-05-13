import 'package:booking_app/reusable_widgets/reusable_widget.dart';
import 'package:booking_app/screens/home_screen.dart';
import 'package:booking_app/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passwordTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.teal
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,MediaQuery.of(context).size.height*0.3, 20,0),
          child: Column(
            children: [
              SizedBox(height: 100,),
              reusableTextField("Enter Username", Icons.person_outline, false, _emailTextController),
              SizedBox(height: 20,),
              reusableTextField("Enter Password", Icons.lock_outline,true, _passwordTextController),
              SizedBox(height: 20,),
              SignInSignUpButton(context, true, (){
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
                }).onError((error, stackTrace) {print("Error: ${error}");});
              }),
              SignUpOption()
            ],
          ),
        ),
      ),
    ),
    );
  }
  Row SignUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",style: TextStyle(color: Colors.white70)),
        GestureDetector(onTap:(){
          print("Login Successfully");
          Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUpScreen())).onError((error, stackTrace){
            print("Error: ${error}");
          });
        },
        child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
      ],
    );
  }
}
