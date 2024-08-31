import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {
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
