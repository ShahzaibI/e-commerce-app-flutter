import 'package:flutter/material.dart';
import 'package:signinprac/Pages%20(view)/productInfo.dart';
import 'additems.dart';
import 'Components/item.dart';
import '../App_View_Model/productProvider.dart';
import 'package:provider/provider.dart';
import 'myDrawer.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context,listen: false).fetchBurgerData();
    Provider.of<ProductProvider>(context,listen: false).fetchSandwichData();
    Provider.of<ProductProvider>(context,listen: false).fetchPizzaData();
    Provider.of<ProductProvider>(context,listen: false).getCartData();

    var myProvider=Provider.of<ProductProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          drawer: const MyDrawer(),
          appBar: AppBar(title: Text('Home'),centerTitle: true,backgroundColor: Colors.tealAccent.shade700,
            actions: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddItems()));
                },
                child: const Icon(Icons.add, size: 30,),
              ),
              const SizedBox(
                width: 30,
              ),
            ],),
          body:ListView(
            children: [

              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Burgers',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                    ],
                  ),
                ),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myProvider.burgerslist.length,
                    itemBuilder: (context,index){
                  return Myitems(
                    productImage: myProvider.burgerslist[index].image,
                    productName: myProvider.burgerslist[index].name,
                    productPrice: myProvider.burgerslist[index].price,
                    onPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){return ProductInfo(
                        name: myProvider.burgerslist[index].name,
                        image: myProvider.burgerslist[index].image,
                        price: myProvider.burgerslist[index].price,
                        description: "Burger, is a food consisting of fillings usually a patty of ground meat, typically beefplaced inside a sliced bun or bread roll.",
                      );}));
                    },
                  );
          }
          ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Sandwiches',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                    ],
                  ),
                ),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<ProductProvider>(context).sandwichlist.length,
                    itemBuilder: (context,index){
                      return Myitems(
                        productImage: Provider.of<ProductProvider>(context).sandwichlist[index].image,
                        productName: Provider.of<ProductProvider>(context).sandwichlist[index].name,
                        productPrice: Provider.of<ProductProvider>(context).sandwichlist[index].price,
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){return ProductInfo(
                            name: myProvider.sandwichlist[index].name,
                            image: myProvider.sandwichlist[index].image,
                            price: myProvider.sandwichlist[index].price,
                            description: "A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.",
                          );}));
                        },
                      );
                    }
                ),
              ),

              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Pizzas',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                    ],
                  ),
                ),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<ProductProvider>(context).pizzalist.length,
                    itemBuilder: (context,index){
                      return Myitems(
                        productImage: myProvider.pizzalist[index].image,
                        productName: myProvider.pizzalist[index].name,
                        productPrice: myProvider.pizzalist[index].price,
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){return ProductInfo(
                            name: myProvider.pizzalist[index].name,
                            image: myProvider.pizzalist[index].image,
                            price: myProvider.pizzalist[index].price,
                            description: "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven. A small pizza is sometimes called a pizzetta.",
                          );}));
                        },
                      );
                    }
                ),
              ),


            ],
          ),
        // bottomNavigationBar: ElevatedButton(onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder:(context){
        //     return ReviewCart();
        //   })
        //   );
        // },
        //     child: Text('Review Cart')),
        //bottomNavigationBar: MyBottomNavigationbar(),
      ),
    );
  }
}
