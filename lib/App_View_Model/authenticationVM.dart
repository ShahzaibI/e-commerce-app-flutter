import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../App_Model/authenticationM.dart';

class AuthenticationVM{
  String email = "";
  String pass = "";
  String name = "";
  String phone = "";

  Future signIn() async {

    AuthenticationM auth = AuthenticationM(email,pass);

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: auth.email, password: auth.pass);
  }



  Future signUp() async {
    AuthenticationM auth = AuthenticationM(email,pass);
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: auth.email, password: auth.pass);

  }

  Future SignOut()async{
    await FirebaseAuth.instance.signOut();
  }

  getUserEmail(){
    return FirebaseAuth.instance.currentUser!.email;
  }

}