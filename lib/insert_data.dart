import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class insert_data extends StatefulWidget {
  const insert_data({super.key});

  @override
  State<insert_data> createState() => _insert_dataState();
}

// ignore: camel_case_types
class _insert_dataState extends State<insert_data> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Enter Full Name")),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Email Address")),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: TextFormField(
              controller: pwdController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Enter Password")),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                CollectionReference collref =
                    FirebaseFirestore.instance.collection("Users");
                collref.add({
                  "Email": emailController.text,
                  "Name": nameController.text,
                  "Pwd": pwdController.text
                });
                print("Data Inserted");
              },
              child: const Text("Insert"),
            ),
          )
        ],
      ),
    );
  }
}
