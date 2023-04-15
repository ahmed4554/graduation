import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project/components/components.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/constants/constants.dart';
import 'package:project/models/animal.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  AnimalsModel? model;
  int currentIndex = 0 ;

  @override
  void initState() {

    setState(() {
      model = AnimalsModel.fromJson(animals);
    });

    log(model!.animalsQuestions.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.blue11,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: ()
          {

          },
        ),
        title: Text(
          'Play Quiz',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Text(
                  'Question ${currentIndex + 1 } / ${model!.animalsQuestions.length}',
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            ),
            Expanded(
              child: BuildMultiShadowContainer(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      currentIndex = index;
                      return MultiChoiseQuestionComponent(
                        model: model!.animalsQuestions[index],
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: model!.animalsQuestions.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}