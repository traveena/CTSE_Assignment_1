import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateHealth extends StatefulWidget {
  final String id;
  UpdateHealth({Key? key, required this.id}) : super(key: key);

  @override
  _UpdateHealthState createState() => _UpdateHealthState();
}

class _UpdateHealthState extends State<UpdateHealth> {
  final _formKey = GlobalKey<FormState>();

  // Updaing Health
  CollectionReference healths = FirebaseFirestore.instance.collection('health');

  Future<void> updateHealth(
      id, wateramount, calories, burnCalories, exerciseHours, day, date) {
    return healths
        .doc(id)
        .update({
          'wateramount': wateramount,
          'calories': calories,
          'burnCalories': burnCalories,
          'exerciseHours': exerciseHours,
          'day': day,
          'date': date
        })
        .then((value) => print("Health notes Updated"))
        .catchError((error) => print("Failed to update health notes: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Health Notes List"),
      ),
      body: Form(
          key: _formKey,
          // Getting Specific Data by ID
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('health')
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
              var wateramount = data!['wateramount'];
              var calories = data['calories'];
              var burnCalories = data['burnCalories'];
              var exerciseHours = data['exerciseHours'];
              var day = data['day'];
              var date = data['date'];

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: day,
                        autofocus: false,
                        onChanged: (value) => day = value,
                        decoration: InputDecoration(
                          labelText: 'Day: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter day';
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
                          labelText: 'Date: ',
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
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: wateramount,
                        autofocus: false,
                        onChanged: (value) => wateramount = value,
                        decoration: InputDecoration(
                          labelText: 'Water Amount(L): ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter wateramount';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: calories,
                        autofocus: false,
                        onChanged: (value) => calories = value,
                        decoration: InputDecoration(
                          labelText: 'Calories: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter calories';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: burnCalories,
                        autofocus: false,
                        onChanged: (value) => burnCalories = value,
                        decoration: InputDecoration(
                          labelText: 'Burn Calories: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter burnCalories';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: exerciseHours,
                        autofocus: false,
                        onChanged: (value) => exerciseHours = value,
                        decoration: InputDecoration(
                          labelText: 'Exercise Hours: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter exercise hours';
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
                                updateHealth(widget.id, wateramount, calories,
                                    burnCalories, exerciseHours, day, date);
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
