import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddWork extends StatefulWidget {
  AddWork({Key? key}) : super(key: key);

  @override
  _AddWorkState createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {
  final _formKey = GlobalKey<FormState>();

  var title = "";
  var description = "";
  var progress = "";
  var deadline = "";
  var date = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final progressController = TextEditingController();
  final deadlineController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descriptionController.dispose();
    progressController.dispose();
    deadlineController.dispose();
    dateController.dispose();
    super.dispose();
  }

  clearText() {
    titleController.clear();
    descriptionController.clear();
    progressController.clear();
    deadlineController.clear();
    dateController.clear();
  }

  // Adding Student
  CollectionReference works = FirebaseFirestore.instance.collection('work');

  Future<void> addWork() {
    return works
        .add({
          'title': titleController.text,
          'description': descriptionController.text,
          'progress': progress,
          'deadline': deadlineController.text,
          'date': dateController.text
        })
        .then((value) => print('Work Notes Added'))
        .catchError((error) => print('Failed to Work Notes: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Work Notes"),
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
                    labelText: 'Title: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Title';
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
                    labelText: 'Progress: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: progressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter the Progress';
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
                    labelText: 'Deadline: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: deadlineController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter the Deadline';
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
                            title = titleController.text;
                            description = descriptionController.text;
                            progress = progressController.text;
                            deadline = deadlineController.text;
                            date = dateController.text;
                            addWork();
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
