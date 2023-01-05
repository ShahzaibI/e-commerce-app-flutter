import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../App_View_Model/productProvider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({this.name='',this.price=0,this.image='',this.description=''});

  String image;
  String name;
  String description;
  int price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Product Overview'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent.shade700,
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 65,
                  padding: EdgeInsets.all(5),
                  child: InkWell(
                    onTap: (){
                      var prov = Provider.of<ProductProvider>(context,listen: false);
                      bool c=false;
                      prov.cartList.forEach((element) {
                        if(element.name==name){
                          c=true;
                          element.quantity++;
                          var total = element.quantity;
                          Fluttertoast.showToast(msg: '$name added $total times in cart',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.grey,
                            fontSize: 15,
                          );
                        }
                      });
                      if(!c){
                        prov.addToCart(name, price, image); // add element in cart with calling function of provider view model
                        Fluttertoast.showToast(msg: '$name added in cart',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          fontSize: 15,
                        );
                      }
                    },
                    child: Center(child: Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 250,
                  child: Center(child: Image.network(image))),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                    style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Product Name: ',style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: name),
                    ],
                    ),
                  ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: 'Price: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: price.toString(),),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: 'Product Info: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: description),
                  ],
                ),
              ),
            ],
              ),
            )
          ],
          
        ),
      ),
    );
  }
}
