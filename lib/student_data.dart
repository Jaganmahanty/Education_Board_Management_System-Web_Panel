import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class student_data extends StatefulWidget {
  const student_data({super.key});

  @override
  State<student_data> createState() => _student_dataState();
}

// ignore: camel_case_types
class _student_dataState extends State<student_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Studen Data",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 50,
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
      ),
      body: const Column(
        children: [student_data_widget()],
      ),
    );
  }
}

// ignore: camel_case_types
class student_data_widget extends StatefulWidget {
  const student_data_widget({super.key});

  @override
  State<student_data_widget> createState() => _student_data_widgetState();
}

// ignore: camel_case_types
class _student_data_widgetState extends State<student_data_widget> {
  final _studentStream =
      FirebaseFirestore.instance.collection('Student_Information').snapshots();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: RefreshIndicator(
          onRefresh: _refreshData,
          child: StreamBuilder(
              stream: _studentStream,
              builder: (context, snapshot) {
                var docs = snapshot.data!.docs;
                if (snapshot.hasError) {
                  return const Text('Connection Error');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...');
                }

                //return Text('${docs.length}');
                return Scrollbar(
                    child: ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            margin: const EdgeInsets.only(
                                top: 15, bottom: 10, left: 7, right: 7),
                            // Set margin to zero to remove white spaces
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 7),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  maxRadius: 14,
                                                  backgroundColor: Colors
                                                      .deepPurple.shade100,
                                                  child: Text(
                                                    "${index + 1}",
                                                    style: const TextStyle(
                                                        color: Colors
                                                            .deepPurpleAccent),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                        "Personal Details",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    const Divider(
                                                      height: 2,
                                                      thickness: 1,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(height: 3),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "Student Name : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['Student_Name'],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(height: 1),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "Father's Name : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ["Father's_Name"],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(height: 1),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "Mother's Name : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ["Mother's_Name"],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const Text(
                                                        "Academic Details",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    const Divider(
                                                      height: 2,
                                                      thickness: 1,
                                                    ),
                                                    const SizedBox(height: 3),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "Student UID No : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index][
                                                              "Student_UID_No"],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "G.R.No.: ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ["GR_No"],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const Text(
                                                        "Editional Details",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    const Divider(
                                                      height: 2,
                                                      thickness: 1,
                                                    ),
                                                    const SizedBox(height: 3),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "Aadhar Card No : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index][
                                                              "Aadhar_Card_No"],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "Name Of Bank : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ["Bank_Name"],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "Bank Account No : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index][
                                                              "Bank_Account_No"],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }));
              })),
    ));
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {});
  }
}
