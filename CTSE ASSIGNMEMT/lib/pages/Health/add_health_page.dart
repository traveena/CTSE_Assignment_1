import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//defines Add health widget
class AddHealth extends StatefulWidget {
  AddHealth({Key? key}) : super(key: key);

  @override
  _AddHealthState createState() => _AddHealthState();
}

class _AddHealthState extends State<AddHealth> {
  final _formKey = GlobalKey<FormState>();

  var wateramount = "";
  var calories = "";
  var exerciseHours = "";
  var burnCalories = "";
  var day = "";
  var date = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final waterAmountController = TextEditingController();
  final caloriesController = TextEditingController();
  final exerciseHoursController = TextEditingController();
  final burnCaloriesController = TextEditingController();
  final dayController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    waterAmountController.dispose();
    caloriesController.dispose();
    exerciseHoursController.dispose();
    burnCaloriesController.dispose();
    dayController.dispose();
    dateController.dispose();
    super.dispose();
  }

  clearText() {
    waterAmountController.clear();
    caloriesController.clear();
    exerciseHoursController.clear();
    burnCaloriesController.clear();
    dayController.clear();
    dateController.clear();
  }

  // Adding health
  CollectionReference healths = FirebaseFirestore.instance.collection('health');

  Future<void> addHealth() {
    return healths
        .add({
          'wateramount': wateramount,
          'calories': calories,
          'exerciseHours': exerciseHours,
          'burnCalories': burnCalories,
          'day': day,
          'date': date
        })
        .then((value) => print('Health Notes Added'))
        .catchError((error) => print('Failed to health notes: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Health Notes"),
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
                    labelText: 'Day: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: dayController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Day';
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
                      return 'Please enter the date';
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
                    labelText: 'Water Amount(L): ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: waterAmountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Water Amount';
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
                    labelText: 'Number of Calories: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: caloriesController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Number of Calories';
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
                    labelText: 'Hours of Exercise: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: exerciseHoursController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Hours of Exercise';
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
                    labelText: 'Number of Calories Burned: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: burnCaloriesController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Number of Calories Burned';
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
                            wateramount = waterAmountController.text;
                            calories = caloriesController.text;
                            exerciseHours = exerciseHoursController.text;
                            burnCalories = burnCaloriesController.text;
                            day = dayController.text;
                            date = dateController.text;
                            addHealth();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Add',
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
