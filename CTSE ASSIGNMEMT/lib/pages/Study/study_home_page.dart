import 'package:flutter/material.dart';
import 'package:flutter_fbfirestore_crud/pages/Study/add_study_page.dart';
import 'package:flutter_fbfirestore_crud/pages/Study/list_study_page.dart';

class StudyHomePage extends StatefulWidget {
  StudyHomePage({Key? key}) : super(key: key);

  @override
  _StudyHomePageState createState() => _StudyHomePageState();
}

class _StudyHomePageState extends State<StudyHomePage> {
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
                    builder: (context) => AddStudy(),
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
         
          ),
          Expanded(
            child: ListStudy(),
          ),
        ],
      ),
    );
  }
}
