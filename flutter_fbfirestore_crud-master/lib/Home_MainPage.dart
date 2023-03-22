import 'package:flutter/material.dart';

import 'package:flutter_fbfirestore_crud/pages/Health/health_home_page.dart';
import 'package:flutter_fbfirestore_crud/pages/Work/work_home_page.dart';
import 'package:flutter_fbfirestore_crud/pages/Study/study_home_page.dart';
import 'package:flutter_fbfirestore_crud/pages/Personal/personal_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonWidth = 150.0;
    final buttonHeight = 50.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("EZ NOTES"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkHomePage()),
                  );
                },
                child: Text("Work"),
              ),
            ),

            SizedBox(height: 16.0), // add spacing between buttons
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthHomePage()),
                  );
                },
                child: Text("Health"),
              ),
            ),

            SizedBox(height: 16.0), // add spacing between buttons
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudyHomePage()),
                  );
                },
                child: Text("Study"),
              ),
            ),
            SizedBox(height: 16.0), // add spacing between buttons
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalHomePage()),
                  );
                },
                child: Text("Personal"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
