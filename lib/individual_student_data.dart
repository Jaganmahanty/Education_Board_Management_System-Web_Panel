import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class IndividualStudentDetails extends StatefulWidget {
  // ignore: use_super_parameters
  final DocumentSnapshot<Object?> documentSnapshot;
  const IndividualStudentDetails({
    super.key,
    required this.documentSnapshot,
  });

  @override
  State<IndividualStudentDetails> createState() =>
      _IndividualStudentDetailsState();
}

class _IndividualStudentDetailsState extends State<IndividualStudentDetails> {
  bool _isVerified = false;
  @override
  void initState() {
    super.initState();
    // Initialize _isMinority based on the Firestore document
    _isVerified = widget.documentSnapshot['Is_Verified'] ?? false;
  }

  Future<void> _updateFirestore() async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('Student_Information') // Change to your collection name
          .doc(widget.documentSnapshot.id);
      await docRef.update({'Is_Verified': _isVerified});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student status updated successfully')),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update status: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final studentName = widget.documentSnapshot['Student_Name'] ?? 'N/A';
    final fatherName = widget.documentSnapshot["Father's_Name"] ?? 'N/A';
    final motherName = widget.documentSnapshot["Mother's_Name"] ?? 'N/A';
    final gender = widget.documentSnapshot['Gender'] ?? 'N/A';
    final religion = widget.documentSnapshot["Religion"] ?? 'N/A';
    final category = widget.documentSnapshot["Category"] ?? 'N/A';
    bool isMinority = widget.documentSnapshot['Is_Minority'] ?? 'N/A';
    final bloodGroup = widget.documentSnapshot["Blood_Group"] ?? 'N/A';
    final birthDate = widget.documentSnapshot["Date_Of_Birth"] ?? 'N/A';
    final birthPlace = widget.documentSnapshot['Place_Of_Birth'] ?? 'N/A';
    final fatherOccupation =
        widget.documentSnapshot["Father's_Occupation"] ?? 'N/A';
    final fatherIncome = widget.documentSnapshot["Father's_Income"] ?? 'N/A';
    final address = widget.documentSnapshot['Address'] ?? 'N/A';
    final pincode = widget.documentSnapshot["Pincode"] ?? 'N/A';
    final city = widget.documentSnapshot["Cith"] ?? 'N/A';
    final mobile1 = widget.documentSnapshot['Mobile_No_1'] ?? 'N/A';
    final mobile2 = widget.documentSnapshot["Mobile_No_2"] ?? 'N/A';
    final email = widget.documentSnapshot["Email_Address"] ?? 'N/A';
    final studentClass = widget.documentSnapshot['Class'] ?? 'N/A';
    final division = widget.documentSnapshot['Division'] ?? 'N/A';
    final rollNo = widget.documentSnapshot['Roll_No'] ?? 'N/A';
    final grNo = widget.documentSnapshot['GR_No'] ?? 'N/A';
    final studentUidNo = widget.documentSnapshot['Student_UID_No'] ?? 'N/A';
    final aadharCardNo = widget.documentSnapshot['Aadhar_Card_No'] ?? 'N/A';
    final bankName = widget.documentSnapshot['Bank_Name'] ?? 'N/A';
    final ifscCode = widget.documentSnapshot['Bank_IFSC_Code'] ?? 'N/A';
    final accountNo = widget.documentSnapshot['Bank_Account_No'] ?? 'N/A';

    final minority = isMinority ? 'Yes' : 'No';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$studentName   ${studentClass}th/$division - $rollNo   ( $studentUidNo ) ",
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 50,
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Personal')),
                        DataColumn(label: Text('Information')),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Text('Student Name : ')),
                          DataCell(Text(studentName)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("Father's Name : ")),
                          DataCell(Text(fatherName)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("Mother's Name : ")),
                          DataCell(Text(motherName)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Gender : ')),
                          DataCell(Text(gender)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Religion : ')),
                          DataCell(Text(religion)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Category : ')),
                          DataCell(Text(category)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Minority : ')),
                          DataCell(Text(minority)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Blood Group : ')),
                          DataCell(Text(bloodGroup)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Date Of Birth : ')),
                          DataCell(Text(birthDate)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("Place Of Birth : ")),
                          DataCell(Text(birthPlace)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("Father's Occupation : ")),
                          DataCell(Text(fatherOccupation)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("Father's Yearly Income : ")),
                          DataCell(Text(fatherIncome)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Full Address : ')),
                          DataCell(Text(
                            address,
                          )),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Pincode : ')),
                          DataCell(Text(pincode)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("City : ")),
                          DataCell(Text(city)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Mobile No 1 : ')),
                          DataCell(Text(mobile1)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Mobile No 2 : ')),
                          DataCell(Text(mobile2)),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text('Email Address : ')),
                          DataCell(Text(email)),
                        ]),
                      ],
                      headingRowColor: WidgetStateProperty.all(
                          Colors.deepPurpleAccent), // Customize header color
                      dataRowColor: WidgetStateProperty.all(
                          Colors.white), // Customize row background color
                      headingTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      dataTextStyle: const TextStyle(color: Colors.black),
                      columnSpacing: 30, // Adjust the spacing between columns
                      dividerThickness: 2, // Thickness of dividers between rows
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Acedemic')),
                      DataColumn(label: Text('Information')),
                    ],
                    rows: [
                      DataRow(cells: [
                        const DataCell(Text('class')),
                        DataCell(Text(studentClass)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text("Division")),
                        DataCell(Text(division)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Roll No')),
                        DataCell(Text(rollNo)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('GR No')),
                        DataCell(Text(grNo)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Student UID No')),
                        DataCell(Text(studentUidNo)),
                      ]),
                    ],
                    headingRowColor: WidgetStateProperty.all(
                        Colors.deepPurpleAccent), // Customize header color
                    dataRowColor: WidgetStateProperty.all(
                        Colors.white), // Customize row background color
                    headingTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    dataTextStyle: const TextStyle(color: Colors.black),
                    columnSpacing: 30, // Adjust the spacing between columns
                    dividerThickness: 2, // Thickness of dividers between rows
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      DataTable(
                        columns: const [
                          DataColumn(label: Text('Editional')),
                          DataColumn(label: Text('Information')),
                        ],
                        rows: [
                          DataRow(cells: [
                            const DataCell(Text('Aadhar Card No : ')),
                            DataCell(Text(aadharCardNo)),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Bank Name : ')),
                            DataCell(Text(bankName)),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text("IFSC Code : ")),
                            DataCell(Text(ifscCode)),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Bank Account No : ')),
                            DataCell(Text(accountNo)),
                          ]),
                        ],
                        headingRowColor: WidgetStateProperty.all(
                            Colors.deepPurpleAccent), // Customize header color
                        dataRowColor: WidgetStateProperty.all(
                            Colors.white), // Customize row background color
                        headingTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        dataTextStyle: const TextStyle(color: Colors.black),
                        columnSpacing: 30, // Adjust the spacing between columns
                        dividerThickness:
                            2, // Thickness of dividers between rows
                      ),
                      const SizedBox(
                        height: 250,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            // Shape of the button
                            borderRadius:
                                BorderRadius.circular(7), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isVerified =
                                !_isVerified; // Toggle minority status
                          });
                          _updateFirestore(); // Update Firestore
                          Navigator.pop(context);
                        },
                        child: const Text("Verify Student"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
