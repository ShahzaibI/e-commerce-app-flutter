import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:signinprac/Pages%20(view)/mainPage.dart';

import '../App_View_Model/add_new_itemVM.dart';
import '../App_View_Model/upload_imageVM.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  UploadImage uploadVM =
      UploadImage(); // view model of upload image on cloud storage
  AddItemsVM add_itemsVM = AddItemsVM();
  String itemName = '';
  String image = '';
  int price = 0;
  String itemType = '';
  final List _addName = [];
  final List _addPrice = [];
  final List _addImage = [];
  final List _addType = [];

  static const List<String> list = <String>['Burger', 'Pizza', 'Sandwich'];
  String dropdownFirstValue = list[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Add New Items'),
          centerTitle: true,
          backgroundColor: Colors.tealAccent.shade700),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                itemName = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food Name',
                hintText: 'Enter Food name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) {
                price = int.parse(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food Price',
                hintText: 'Enter Food Price',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: dropdownFirstValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 16,
              decoration: const InputDecoration(
                labelText: 'Select food type',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                  dropdownFirstValue = value!;
                  itemType = dropdownFirstValue;
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: false, //only one file at a time pick
                  type: FileType.custom, //type define bellow line
                  allowedExtensions: ['png', 'jpg','webp'],
                );
                if (result == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('No file selected'),
                  ));
                  return null;
                }
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('File selected'),
                ));
                final path = result.files.single.path;
                final name = result.files.single.name;
                uploadVM.name = name;
                uploadVM.path = path!;
                image = await uploadVM.upload();
                print(image);
                print('ok');
              },
              child: Icon(
                Icons.camera_alt_outlined,
                size: 50,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    _addName.add(itemName);
                    _addPrice.add(price);
                    _addImage.add(image);
                    _addType.add(itemType);
                    setState(() {});
                  },
                  child: Text(
                    'Save Data',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.tealAccent.shade700,
                ),
                const SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  onPressed: () async {
                    for(int i = 0; i<_addName.length; i++){
                      add_itemsVM.newPrice = _addPrice[i];
                      add_itemsVM.newName = _addName[i];
                      add_itemsVM.newImage = _addImage[i];
                      add_itemsVM.foodType = _addType[i];
                      await add_itemsVM.saveData();
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
                  },
                  child: Text(
                    'Exit',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.tealAccent.shade700,
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: _addName.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 10,
                        shadowColor: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 85,
                                child: Image.network(_addImage[index]),
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  height: 100,
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(_addName[index],
                                              style: TextStyle(
                                                  color: Colors.black,)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(_addPrice[index].toString(),
                                              style: TextStyle(
                                                  color: Colors.black))
                                        ],
                                      )),
                                )),
                          ],
                        ),
                      ),
                    );
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
