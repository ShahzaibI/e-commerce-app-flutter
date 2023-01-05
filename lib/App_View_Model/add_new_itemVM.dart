import '../App_Model/productmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AddItemsVM{
  String newImage = '';
  String newName = '';
  int newPrice = 0;
  String foodType = '';
  Future<int> saveData() async{
    ProductModel newData = ProductModel(image:newImage, name: newName, price: newPrice);
    Map<String, dynamic> newMapData = {
      'imageAddress': newData.image,
      'name': newData.name,
      'price': newData.price,
    };
    if(foodType == 'Pizza'){
      await FirebaseFirestore.instance.collection('Pizzas').add(newMapData);
      print('Pizza added');
      return 0;
    }
    else if(foodType == 'Sandwich'){
      await FirebaseFirestore.instance.collection('sandwich').add(newMapData);
      print('Sandwich added');
      return 0;
    }
    else {
      await FirebaseFirestore.instance.collection('burgers').add(newMapData);
      print('Burger added');
      return 0;

    }
  }
}