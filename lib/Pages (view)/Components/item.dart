import 'package:flutter/material.dart';
class Myitems extends StatelessWidget {
   Myitems({this.productImage='',this.productName='',this.productPrice=0,this.onPress});
  // Color colour;
 final String productImage;
 final String productName;
 final int productPrice;
 var onPress;
  //Function var;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.tealAccent,
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20)
          ),
          height: 220,
          width: 170,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                  child: Center(child: Image.network(productImage))),
              Expanded(
                child: Padding(
                padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productName,style: const TextStyle(color: Colors.black,),),
                      SizedBox(height: 5,),
                      Text(productPrice.toString()+' Rs',style: const TextStyle(color: Colors.black,),)
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
