import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lost_found_app/item.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  static const String routeName = "/Details";
  late Item item;
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    widget.item = ModalRoute.of(context)?.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text(widget.item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            //1 image
            Image.file(File(widget.item.image), width: 250),
            //2 description
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
              ),
            ),

            //3 prix
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text(
                  widget.item.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //quantity
            Text("location : ${widget.item.location}"),
            //4 button
            // ElevatedButton.icon(
            //   onPressed: () async {
            //     await Gameservice()
            //         .saveGame(widget.game)
            //         .then(
            //           (value) => showDialog(
            //             context: context,
            //             builder: (context) {
            //               return AlertDialog(
            //                 title: Text("Success"),
            //                 content: Text("game added!!"),
            //               );
            //             },
            //           ),
            //         );
            //   },
            //   icon: Icon(Icons.shopping_basket),

            //   label: Text("Acheter"),
            // ),
          ],
        ),
      ),
    );
  }
}
