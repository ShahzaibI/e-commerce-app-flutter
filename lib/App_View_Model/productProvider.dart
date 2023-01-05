import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../App_Model/productmodel.dart';
import 'package:provider/provider.dart';

class ProductProvider with ChangeNotifier{
  String userName="";
  String userMob="";
  List<ProductModel> burgerslist=[];
  late ProductModel burgers;
  List<ProductModel> sandwichlist=[];
  late ProductModel sandwich;
  List<ProductModel> pizzalist=[];
  late ProductModel pizza;
  List<ProductModel> cartList=[];
  late ProductModel cart;
  List<ProductModel> cartHistoryList=[];
  late ProductModel cartHistory;

  Future fetchBurgerData()async{
    List<ProductModel> newlist=[];
    var basedata = await FirebaseFirestore.instance.collection("burgers").get();
    basedata.docs.forEach((element){
      burgers=ProductModel(
        image: element.get('imageAddress'),
        name: element.get('name'),
        price: element.get('price')
      );
      newlist.add(burgers);
    }
    );
    burgerslist=newlist;
    notifyListeners();
  }

  Future fetchSandwichData()async{
    List<ProductModel> newlist=[];
    var basedata = await FirebaseFirestore.instance.collection("sandwich").get();
    basedata.docs.forEach((element){
      sandwich=ProductModel(
          image: element.get('imageAddress'),
          name: element.get('name'),
          price: element.get('price')
      );
      newlist.add(sandwich);
    }
    );
    sandwichlist=newlist;
    notifyListeners();
  }

  Future fetchPizzaData()async{
    List<ProductModel> newlist=[];
    var basedata = await FirebaseFirestore.instance.collection("Pizzas").get();
    basedata.docs.forEach((element){
      pizza=ProductModel(
          image: element.get('imageAddress'),
          name: element.get('name'),
          price: element.get('price')
      );
      newlist.add(pizza);
    }
    );
    pizzalist=newlist;
    notifyListeners();
  }

  void addToCart(String name, int price, String image){
    cart=ProductModel(
        name: name,
        price: price,
        image: image
    );
    cartList.add(cart);
  }



  Future setcartdata()async{
    for(int i=0;i<cartList.length;i++){
      var basedata = await FirebaseFirestore.instance.collection("mycart").doc(FirebaseAuth.instance.currentUser!.uid).collection('reviewcart').doc();
      basedata.set({
        "imageAddress":cartList[i].image,
        "name":cartList[i].name,
        "price":cartList[i].totalPrice(),
        "quantity":cartList[i].quantity,
      });
    }
  }

  Future setUserdata(String userName,String userMob)async{
    var basedata = await FirebaseFirestore.instance.collection("UserData").doc(FirebaseAuth.instance.currentUser!.uid);
    basedata.set({
      "userName":userName,
      "userMob":userMob,
      "userEmail":FirebaseAuth.instance.currentUser!.email
  });
        }

  Future getCartData()async{
    List<ProductModel> newlist=[];
    var basedata = await FirebaseFirestore.instance.collection("mycart").doc(FirebaseAuth.instance.currentUser!.uid).collection('reviewcart').get();
    basedata.docs.forEach((element){
      cartHistory=ProductModel(
          image: element.get('imageAddress'),
          name: element.get('name'),
          price: element.get('price'),
          quantity: element.get('quantity')
      );
      newlist.add(cartHistory);
    }
    );
    cartHistoryList=newlist;
    notifyListeners();
  }

  Future getUserData()async{
    var basedata = await FirebaseFirestore.instance.collection("UserData").doc(FirebaseAuth.instance.currentUser!.uid).get();
    userMob=basedata.get('userMob');
    userName=basedata.get('userName');
  }

}