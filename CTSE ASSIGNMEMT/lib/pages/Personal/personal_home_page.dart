import 'package:flutter/material.dart';
import 'package:flutter_fbfirestore_crud/pages/Personal/add_personal_page.dart';
import 'package:flutter_fbfirestore_crud/pages/Personal/list_personal_page.dart';

class PersonalHomePage extends StatefulWidget {
  PersonalHomePage({Key? key}) : super(key: key);

  @override
  _PersonalHomePageState createState() => _PersonalHomePageState();
}

class _PersonalHomePageState extends State<PersonalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('EZ NOTES'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPersonal(),
                  ),
                )
              },
              child: Text('Add', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Text(
            //   'Health Notes List',
            //   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            // ),
          ),
          Expanded(
            child: ListPersonal(),
          ),
        ],
      ),
    );
  }
}
