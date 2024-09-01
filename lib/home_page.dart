import 'package:flutter/material.dart';
import 'package:flutter_application_web_panel/insert_data.dart';
import 'package:flutter_application_web_panel/unverified_student_data.dart';
import 'package:flutter_application_web_panel/verified_student_data.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade100,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Jagan Mahanty"),
              accountEmail: Text("jaganmahanty@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Insert Data'),
              onTap: () {
                // Navigate to home or perform action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const insert_data()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Unverified Student Data'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const unverifiedStudentData()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Verified Student Data'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerifiedStudentData()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text("Home Page")),
    );
  }
}
