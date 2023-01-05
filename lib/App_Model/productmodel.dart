class ProductModel{
  String image;
  String name;
  int price;
  int quantity;
  ProductModel({this.image='',this.name='',this.price=0,this.quantity=1});


  int totalPrice(){
    return quantity * price;
  }
}