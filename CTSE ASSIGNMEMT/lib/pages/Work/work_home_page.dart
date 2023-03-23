import 'package:flutter/material.dart';
import 'package:flutter_fbfirestore_crud/pages/Work/add_work_page.dart';
import 'package:flutter_fbfirestore_crud/pages/Work/list_work_page.dart';

class WorkHomePage extends StatefulWidget {
  WorkHomePage({Key? key}) : super(key: key);

  @override
  _WorkHomePageState createState() => _WorkHomePageState();
}

class _WorkHomePageState extends State<WorkHomePage> {
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
                    builder: (context) => AddWork(),
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
            child: ListWork(),
          ),
        ],
      ),
    );
  }
}
