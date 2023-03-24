import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStudy extends StatefulWidget {
  AddStudy({Key? key}) : super(key: key);

  @override
  _AddStudyState createState() => _AddStudyState();
}

class _AddStudyState extends State<AddStudy> {
  final _formKey = GlobalKey<FormState>();
 

  var subjectName = "";
  var description = "";
  var completionStatus = "";
  var dueDate = "";
  var date = "";
  var selectedType;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final subjectNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final completionStatusController = TextEditingController();
  final dueDateController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    subjectNameController.dispose();
    descriptionController.dispose();
    completionStatusController.dispose();
    dueDateController.dispose();
    dateController.dispose();
    super.dispose();
  }

  clearText() {
    subjectNameController.clear();
    descriptionController.clear();
    completionStatusController.clear();
    dueDateController.clear();
    dateController.clear();
  }

  // Adding studies
  CollectionReference studies = FirebaseFirestore.instance.collection('study');

  Future<void> addStudy() {
    return studies
        .add({
          'subjectName': subjectName,
          'description': description,
          'completionStatus': completionStatus,
          'dueDate': dueDate,
          'date': date
        })
        .then((value) => print('Study Notes Added'))
        .catchError((error) => print('Failed to Study Notes: $error'));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Add Study Notes"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Subject: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: subjectNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter subjectName';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Description: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the description';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Completion Status: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: completionStatusController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter the completion status';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Due Date: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: dueDateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter the dueDate';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Date: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: dateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Date';
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
                          setState(() {
                            subjectName = subjectNameController.text;
                            description = descriptionController.text;
                            completionStatus = completionStatusController.text;
                            dueDate = dueDateController.text;
                            date = dateController.text;
                            addStudy();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
