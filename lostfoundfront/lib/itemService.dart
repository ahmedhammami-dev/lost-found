import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lost_found_app/item.dart';

class ItemService {
  Future<void> createItem(String name, String location, String image) async {
    var url = Uri.parse('http://10.0.2.2:8095/lostfound/additem');

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'location': location, 'image': image}),
    );

    if (response.statusCode == 200) {
      print("Item created successfully.");
    } else {
      print("Failed to create item:");
    }
  }

  Future<void> createUser(
    String username,
    String password,
    String email,
    String adress,
    String birthdate,
  ) async {
    var url = Uri.parse('http://10.0.2.2:8095/lostfound/adduser');

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'email': email,
        'adress': adress,
        'birthdate': birthdate,
      }),
    );

    if (response.statusCode == 200) {
      print("user created successfully.");
    } else {
      print("Failed to create user:");
    }
  }

  Future<List<Item>> fetchItems() async {
    var url = Uri.parse('http://10.0.2.2:8095/lostfound/retrieve');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Item> allItems = [];
      for (var u in data) {
        Item item = Item.fromJson(u);
        allItems.add(item);
      }
      print("Items fetched successfully.");
      return allItems; // assuming the API returns a list of items
    } else {
      print("Failed to fetch items: ${response.statusCode}");
      return [];
    }
  }
}
