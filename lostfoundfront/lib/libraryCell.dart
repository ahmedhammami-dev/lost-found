import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lost_found_app/details.dart';
import 'package:lost_found_app/item.dart';

class Librarycell extends StatelessWidget {
  final Item item;
  const Librarycell(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Details.routeName, arguments: item);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Image.file(File(item.image), width: 250),
            Text(item.name, style: TextStyle(fontSize: 16)),
            Text(item.location, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
