import 'package:flutter/material.dart';
import 'package:lost_found_app/item.dart';
import 'package:lost_found_app/itemService.dart';
import 'package:lost_found_app/libraryCell.dart';

class Library extends StatefulWidget {
  static const String routeName = "/Library";

  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  late Future<List<Item>> items;
  @override
  void initState() {
    super.initState();
    final itemService = ItemService();
    items = itemService.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text("Lost And Found"),
      ),
      body: FutureBuilder(
        future: items,
        builder: (context, snapshot) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Librarycell(snapshot.data![index]);
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/additem');
            },
            backgroundColor: Colors.red[300],
            child: Icon(Icons.add, color: Colors.white),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            backgroundColor: Colors.red[300],
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
