import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fbfirestore_crud/pages/Personal/update_personal_page.dart';

class ListPersonal extends StatefulWidget {
  ListPersonal({Key? key}) : super(key: key);

  @override
  _ListPersonalState createState() => _ListPersonalState();
}

class _ListPersonalState extends State<ListPersonal> {
  final Stream<QuerySnapshot> personalsStream =
      FirebaseFirestore.instance.collection('personal').snapshots();

  // For Deleting Personal Notes
  CollectionReference personals =
      FirebaseFirestore.instance.collection('personal');
  Future<void> deletePersonal(id) {
    // print("User Deleted $id");
    return personals
        .doc(id)
        .delete()
        .then((value) => print('Personal Notes Deleted'))
        .catchError((error) => print('Failed to Delete Notes: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: personalsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Personal Notes List',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: storedocs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Event: ${storedocs[index]['title']}',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    'Description: ${storedocs[index]['description']}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    'Status: ${storedocs[index]['status']}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    'Time:${storedocs[index]['time']}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    'Date: ${storedocs[index]['date']}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdatePersonal(
                                              id: storedocs[index]['id']),
                                        ),
                                      )
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => {
                                      deletePersonal(storedocs[index]['id'])
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
