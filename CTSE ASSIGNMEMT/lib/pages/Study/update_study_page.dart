import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateStudy extends StatefulWidget {
  final String id;
  UpdateStudy({Key? key, required this.id}) : super(key: key);

  @override
  _UpdateStudyState createState() => _UpdateStudyState();
}

class _UpdateStudyState extends State<UpdateStudy> {
  final _formKey = GlobalKey<FormState>();

  CollectionReference studies = FirebaseFirestore.instance.collection('study');

  Future<void> updateStudy(
      id, subjectName, description, completionStatus, dueDate, date) {
    return studies
        .doc(id)
        .update({
          'subjectName': subjectName,
          'description': description,
          'completionStatus': completionStatus,
          'dueDate': dueDate,
          'date': date
        })
        .then((value) => print("Study notes Updated"))
        .catchError((error) => print("Failed to update study notes: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update study Notes List"),
      ),
      body: Form(
          key: _formKey,
          // Getting Specific Data by ID
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('study')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var subjectName = data!['subjectName'];
              var description = data['description'];
              var completionStatus = data['completionStatus'];
              var dueDate = data['dueDate'];
              var date = data['date'];

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: subjectName,
                        autofocus: false,
                        onChanged: (value) => subjectName = value,
                        decoration: InputDecoration(
                          labelText: 'Subject Name: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Subject Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: description,
                        autofocus: false,
                        onChanged: (value) => description = value,
                        decoration: InputDecoration(
                          labelText: 'description: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter description';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: completionStatus,
                        autofocus: false,
                        onChanged: (value) => completionStatus = value,
                        decoration: InputDecoration(
                          labelText: 'completionStatus: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter completion status';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: dueDate,
                        autofocus: false,
                        onChanged: (value) => dueDate = value,
                        decoration: InputDecoration(
                          labelText: 'dueDate: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter dueDate';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: date,
                        autofocus: false,
                        onChanged: (value) => date = value,
                        decoration: InputDecoration(
                          labelText: 'date: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter date';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              if (_formKey.currentState!.validate()) {
                                updateStudy(widget.id, subjectName, description,
                                    completionStatus, dueDate, date);
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'Update',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => {},
                            child: Text(
                              'Reset',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
