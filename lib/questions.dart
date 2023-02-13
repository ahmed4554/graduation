import 'package:flutter/material.dart';
import 'package:project/modules/child_app/content_screens/shapes/shapes.dart';
import '../../../constants/constants.dart';

class QuestionsScreen extends StatefulWidget {
  Shapes? questions;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreen();
}

class _QuestionsScreen extends State<QuestionsScreen> {

  @override
  void initState() {
    widget.questions = Shapes.fromJson(shapes);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
          [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                widget.questions!.questions![0],
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
