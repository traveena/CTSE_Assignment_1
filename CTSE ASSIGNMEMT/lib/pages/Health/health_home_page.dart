import 'package:flutter/material.dart';
import 'package:flutter_fbfirestore_crud/pages/Health/add_health_page.dart';
import 'package:flutter_fbfirestore_crud/pages/Health/list_health_page.dart';

class HealthHomePage extends StatefulWidget {
  HealthHomePage({Key? key}) : super(key: key);

  @override
  _HealthHomePageState createState() => _HealthHomePageState();
}

class _HealthHomePageState extends State<HealthHomePage> {
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
                    builder: (context) => AddHealth(),
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
            child: ListHealth(),
          ),
        ],
      ),
    );
  }
}
