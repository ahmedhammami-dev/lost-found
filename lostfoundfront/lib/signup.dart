import 'package:flutter/material.dart';
import 'package:lost_found_app/customInputdecoration.dart';
import 'package:lost_found_app/itemService.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  static const String routeName = "/Signup";
  late String username, email, password, birthdate, address;
  GlobalKey<FormState> currentKey = GlobalKey();
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red[400], title: Text("Sign Up")),
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
                        "username",
                        "username",
                        Icon(Icons.person_2),
                      ).customDecoration(),
                  onSaved: (newValue) => username = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username should not be empty";
                    }
                    return null;
                  },
                ),
              ),
              //email
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration:
                      Custominputdecoration(
                        "email",
                        "email",
                        Icon(Icons.email),
                      ).customDecoration(),
                  onSaved: (newValue) => email = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email should not be empty";
                    }
                    return null;
                  },
                ),
              ),
              //password
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  obscureText: true,
                  decoration:
                      Custominputdecoration(
                        "password",
                        "password",
                        Icon(Icons.password),
                      ).customDecoration(),
                  onSaved: (newValue) => password = newValue!,
                  validator: (value) {
                    if (value!.length < 8) {
                      return "password should have min 8 caracters";
                    }
                    return null;
                  },
                ),
              ),
              //address
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration:
                      Custominputdecoration(
                        "address",
                        "address",
                        Icon(Icons.house),
                      ).customDecoration(),
                  onSaved: (newValue) => address = newValue!,
                ),
              ),
              //birthdate
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration:
                      Custominputdecoration(
                        "birthdate",
                        "birthdate",
                        Icon(Icons.cake),
                      ).customDecoration(),
                  onSaved: (newValue) => birthdate = newValue!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (currentKey.currentState!.validate()) {
                        currentKey.currentState!.save();
                        final itemService = ItemService();
                        await itemService.createUser(
                          username,
                          password,
                          email,
                          address,
                          birthdate,
                        );
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return (AlertDialog(
                              title: Text("sign up"),
                              content: Text("sign up"),
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
