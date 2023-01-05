import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../App_Model/upload_imageModel.dart';


class UploadImage{
  String name = '';
  String path = '';

  Future<String> upload() async{
    final FirebaseStorage storage = FirebaseStorage.instance; //creating object of FirebaseStorage
    File file = File(path!);
    UploadImageM uploadimageObj = UploadImageM(name,path);

    String name1 = uploadimageObj.name;
      await storage.ref('$name1').putFile(file).then((p0) => print('Done')); //upload file on cloud storage
      String url = await storage.ref().child('$name1').getDownloadURL(); // get link of uploaded image
      return url;
  }
}