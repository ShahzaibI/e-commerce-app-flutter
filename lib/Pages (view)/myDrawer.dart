import 'package:signinprac/Pages%20(view)/reviewcart.dart';
import '../App_View_Model/authenticationVM.dart';
import 'cartHistory.dart';
import 'package:flutter/material.dart';
import 'mainPage.dart';

Widget listTile({IconData ?icon, String title=""}){
  return ListTile(
    leading: Icon(
        icon,
      size: 32,
      color: Colors.tealAccent.shade700,
    ),
    title: Text(
      title,
      style: TextStyle(color: Colors.black45),
    ),
  );
}
// Future SignOut()async{
//   await FirebaseAuth.instance.signOut();
// }
class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  AuthenticationVM auth = AuthenticationVM();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orange
              ),
                child: Center(
                   child: Column(
                     children: [
                       const CircleAvatar(
                         backgroundImage: AssetImage('assets/prof.jpeg'),
                         backgroundColor: Colors.black45,
                         radius: 50,
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       Text( auth.getUserEmail() ?? "Unknown"),
                     ],
                   ),
                )
            ),

            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return MainPage();
                  }));
                },
                child: listTile(icon: Icons.home_outlined,title: "Home")
            ),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ReviewCart();
                  }));
                },
                child: listTile(icon: Icons.shop_outlined,title: "Review Cart")),

            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return History();
                  }));
                },
                child: listTile(icon: Icons.history_outlined,title: "Order History")),

            InkWell(
                onTap: auth.SignOut,
                child: listTile(icon: Icons.logout_outlined,title: "Sign out")),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 280,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Center(child: Text("Support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                    Center(child: Text("Contact: 03056989967")),
                    Center(child: Text("Email: sg03056924122@gmail.com"))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
