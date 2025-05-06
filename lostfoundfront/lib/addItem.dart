import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_found_app/customInputdecoration.dart';
import 'package:lost_found_app/itemService.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  File? _pickedImage;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  late String name, location;

  GlobalKey<FormState> currentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red[400], title: Text("add item")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: currentKey,
          child: ListView(
            children: [
              Image.asset("assets/lostfound.jpg", width: 250),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration:
                      Custominputdecoration(
                        "name",
                        "name",
                        Icon(Icons.person_2),
                      ).customDecoration(),
                  onSaved: (newValue) => name = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "name should not be empty";
                    }
                    return null;
                  },
                ),
              ),
              //location
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration:
                      Custominputdecoration(
                        "location",
                        "location",
                        Icon(Icons.location_city),
                      ).customDecoration(),
                  onSaved: (newValue) => location = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "loction should not be empty";
                    }
                    return null;
                  },
                ),
              ),

              //image
              // Image Picker Button
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: Icon(Icons.image),
                label: Text("Pick Image"),
              ),

              SizedBox(height: 10),

              // Show Picked Image
              _pickedImage != null
                  ? Image.file(_pickedImage!, height: 100)
                  : Text("No image selected"),

              //btn
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (currentKey.currentState!.validate()) {
                        currentKey.currentState!.save();
                        final itemService = ItemService();
                        await itemService.createItem(
                          name,
                          location,
                          _pickedImage?.path ?? '',
                        );
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return (AlertDialog(
                              title: Text("add item"),
                              content: Text("item Added"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pop(); // Close the dialog
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ));
                          },
                        );
                        Navigator.pushNamed(context, '/library');
                      }
                    },
                    child: Text("Submit"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/library');
        },
        backgroundColor: Colors.red[300],
        child: Icon(Icons.home, color: Colors.white),
      ),
    );
  }
}
