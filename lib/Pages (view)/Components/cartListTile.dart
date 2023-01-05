import 'package:flutter/material.dart';
import 'package:signinprac/Pages%20(view)/mainPage.dart';
import 'package:provider/provider.dart';
import '../../App_View_Model/productProvider.dart';
import '../reviewcart.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartListTile extends StatelessWidget {
  CartListTile({this.lname = "", this.limage = "", this.lprice = 0, this.lquantity = 0});

  String limage;
  String lname;
  int lprice;
  int lquantity;

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        shadowColor: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                height: 85,
                child: Image.network(limage),
            )),
            Expanded(
              child: Container(
                height: 100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(lname, style: const TextStyle(
                        color: Colors.black)),
                      const SizedBox(
                        height: 5,
                      ),
                      // Text(totalPrice!().toString() + ' Rs',
                      Text(lprice.toString() + ' Rs',
                          style: const TextStyle(color: Colors.black))
                    ],
                  )
                ),
              )
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    child: Center(
                      child: Text('Quantity: ' + lquantity.toString(),
                      style: const TextStyle(
                        color: Colors.black),
                      )
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      bool check = false;
                      var ele;
                      myProvider.cartList.forEach((element) {
                        if (element.name == lname) {
                          check = true;
                          ele = element;
                        }
                      });
                      if (check) {
                        myProvider.cartList.remove(ele);
                        myProvider.notifyListeners();
                        Fluttertoast.showToast(
                          msg: '$lname remove from cart',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.grey,
                          fontSize: 15,
                        );
                      }
                    },
                    child: Icon(Icons.delete)
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
