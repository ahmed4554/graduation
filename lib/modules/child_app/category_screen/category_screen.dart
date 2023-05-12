import 'package:flutter/material.dart';
import 'package:project/components/components.dart';
import 'package:project/constants/constants.dart';
import 'package:project/models/qAlpha.dart';
import 'package:project/models/qAnimals.dart';
import 'package:project/models/qNumbers.dart';
import 'package:project/models/qShapes.dart';
import 'package:project/modules/child_app/activity_screen/activity_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<dynamic> models = [];

  @override
  void initState() {
    models = [
      QAlpha.fromJson(qAlpha),
      QNumbers.fromJson(qNumbers),
      QShapes.fromJson(qShapes),
      QAnimals.fromJson(qAnimals),
      QAlpha.fromJson(qAlpha),
      QAlpha.fromJson(qAlpha),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Category',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) {
                                return QuestionsScreen(
                                    quiz: models[index] ,
                                    index: index
                                );
                              }
                          ),
                        );
                      },
                      child: CategoryComponent(
                          color: colors[index],
                          name: names[index],
                          picName: picNames[index],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 20.0,
                    ),
                itemCount: 6)));
  }
}
