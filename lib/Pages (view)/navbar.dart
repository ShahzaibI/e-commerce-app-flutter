import 'package:flutter/material.dart';
import 'package:signinprac/Pages%20(view)/additems.dart';
import 'package:signinprac/Pages%20(view)/cartHistory.dart';
import 'package:signinprac/Pages%20(view)/reviewcart.dart';
import 'mainPage.dart';
class MyNav extends StatefulWidget {
  const MyNav({Key? key}) : super(key: key);

  @override
  State<MyNav> createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> {
  int currentIndex=0;
  final screens=[
    MainPage(),
    ReviewCart(),
    History(),
    AddItems(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex=index;
          }),
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedItemColor: Colors.amber,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.history_outlined),  label: 'Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add Item'),
          ]),

    );
  }
}
