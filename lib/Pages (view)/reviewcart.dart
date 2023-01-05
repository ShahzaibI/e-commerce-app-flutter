import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../App_View_Model/productProvider.dart';
import 'Components/cartListTile.dart';
import 'Components/button.dart';
class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Cart'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Container(

        height: double.infinity,
        width: double.infinity,
        child:  Column(
          children: [
            Expanded(

              child: Container(
                child: ListView.builder(

                  itemCount: Provider.of<ProductProvider>(context).cartList.length,
                  itemBuilder: (context,index){
                    return CartListTile(
                      limage: Provider.of<ProductProvider>(context).cartList[index].image,
                      lname: Provider.of<ProductProvider>(context).cartList[index].name,
                      lprice: Provider.of<ProductProvider>(context).cartList[index].totalPrice(),
                      lquantity: Provider.of<ProductProvider>(context).cartList[index].quantity,

                    );
                  }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RoundedButton(colour: Colors.orangeAccent, buttonTitle: 'Place Order', onPressedFunction: ()async{
                await Provider.of<ProductProvider>(context,listen: false).setcartdata();
                Provider.of<ProductProvider>(context,listen: false).cartList=[];
                Provider.of<ProductProvider>(context,listen: false).getCartData();
                Provider.of<ProductProvider>(context,listen: false).notifyListeners();
              }, Elevation: 10),
            )
          ],
        ),
      ),
    );
  }
}
