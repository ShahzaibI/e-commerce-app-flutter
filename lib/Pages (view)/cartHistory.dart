import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../App_View_Model/productProvider.dart';
import 'Components/orderhistoryList.dart';


class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders History'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Container(

        height: double.infinity,
        width: double.infinity,
        child:  ListView.builder(

            itemCount: Provider.of<ProductProvider>(context).cartHistoryList.length,
            itemBuilder: (context,index){
              return historyListTile(
                limage: Provider.of<ProductProvider>(context).cartHistoryList[index].image,
                lname: Provider.of<ProductProvider>(context).cartHistoryList[index].name,
                lprice: Provider.of<ProductProvider>(context).cartHistoryList[index].price,
                lquantity: Provider.of<ProductProvider>(context).cartHistoryList[index].quantity,

              );
            }),


      ),
    );
  }
}
