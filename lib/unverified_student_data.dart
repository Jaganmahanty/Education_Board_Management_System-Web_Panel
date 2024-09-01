import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_web_panel/individual_student_data.dart';

// ignore: camel_case_types
class unverifiedStudentData extends StatefulWidget {
  const unverifiedStudentData({super.key});

  @override
  State<unverifiedStudentData> createState() => _unverifiedStudentDataState();
}

// ignore: camel_case_types
class _unverifiedStudentDataState extends State<unverifiedStudentData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Data",
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
      body: const StudentDataWidget(),
    );
  }
}

class StudentDataWidget extends StatefulWidget {
  const StudentDataWidget({super.key});

  @override
  State<StudentDataWidget> createState() => _StudentDataWidgetState();
}

class _StudentDataWidgetState extends State<StudentDataWidget> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedClass = 'All';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Set the width of each card, and calculate number of cards per row
    const cardWidth = 350; // You can adjust this value as needed
    const cardHeight = 102;
    final crossAxisCount = (screenWidth / cardWidth).floor();

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 30),
            child: Row(
              children: [
                SizedBox(
                  width: 360, // Adjust the width as needed
                  height: 45, // Adjust the height as needed
                  child: TextField(
                    controller: _searchController,
                    onChanged: (query) {
                      setState(() {
                        _searchQuery = query;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Search Student by Name or Roll No',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                // Dropdown menu for class selection
                SizedBox(
                  height: 45,
                  width: 70,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        labelText: "Class",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    value: _selectedClass,
                    items: <String>['All', '9', '10', '11', '12']
                        .map((String className) {
                      return DropdownMenuItem<String>(
                        value: className,
                        child: Text(className),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedClass = newValue!;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: StreamBuilder<QuerySnapshot>(
                stream: _filteredStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Connection Error'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No students found"));
                  }

                  var docs = snapshot.data!.docs;

                  // Filter data based on search query
                  docs = docs.where((doc) {
                    final name = doc['Student_Name'].toString().toLowerCase();
                    final rollNo = doc['Roll_No'].toString().toLowerCase();
                    return name.contains(_searchQuery.toLowerCase()) ||
                        rollNo.contains(_searchQuery.toLowerCase());
                  }).toList();

                  return Scrollbar(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0,
                        childAspectRatio: cardWidth / cardHeight,
                      ),
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      IndividualStudentDetails(
                                        documentSnapshot:
                                            snapshot.data!.docs[index],
                                      )),
                            );
                          },
                          child: Card(
                            color: Colors.deepPurpleAccent,
                            margin: const EdgeInsets.all(5.0),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 7),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
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
                                                  maxRadius: 12,
                                                  backgroundColor: Colors.white,
                                                  child: Text(
                                                    "${index + 1}",
                                                    style: const TextStyle(
                                                        color: Colors
                                                            .deepPurpleAccent),
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      docs[index][
                                                              'Student_Name'] ??
                                                          'N/A',
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      '${docs[index]["Class"] ?? 'N/A'}th/${docs[index]["Division"] ?? 'N/A'} - ${docs[index]["Roll_No"] ?? 'N/A'}',
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(height: 1),
                                                    Text(
                                                      '${docs[index]["GR_No"] ?? 'N/A'}/${docs[index]["Student_UID_No"] ?? 'N/A'}',
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stream<QuerySnapshot> _filteredStream() {
    // Create the base query
    Query query = FirebaseFirestore.instance.collection('Student_Information');

    // Apply class filter if selected
    if (_selectedClass != 'All') {
      query = query.where('Class', isEqualTo: _selectedClass);
    }
    query = query.where('Is_Verified', isEqualTo: false);
    return query.snapshots();
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {});
  }
}
