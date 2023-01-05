import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signinprac/Pages%20(view)/mainPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signinprac/Pages%20(view)/productInfo.dart';
import 'Pages (view)/navbar.dart';
import 'Pages (view)/signinScreen.dart';
import 'package:provider/provider.dart';
import 'App_View_Model/productProvider.dart';
import 'Pages (view)/reviewcart.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context)=>ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home:StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return MyNav();
                //return ProductInfo();
              }
              else{
                return LoginScreen();
              }
            }
          )
      ),
    );
  }
}
