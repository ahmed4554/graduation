import 'package:flutter/material.dart';
import 'package:project/components/components.dart';
import 'package:project/components/custom_color.dart';

class QuestionsScreen extends StatefulWidget {
   QuestionsScreen({Key? key,required this.quiz,required this.index}) : super(key: key);

  final dynamic quiz;
  int index;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentIndex = 0;

  PageController controller = PageController();


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
          onPressed: () {},
        ),
        title: Text(
          'Play Quiz',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Question ${currentIndex + 1} / ${widget.quiz.questions.length}', textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Expanded(
                child: BuildMultiShadowContainer(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: PageView.builder(
                      controller: controller,
                      onPageChanged: (int index) {
                        currentIndex = index;
                        setState(() {});
                      },
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: MultiChoiseQuestionComponent(
                                  model: widget.quiz.questions[index],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColor.blue11,
                                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0)
                                    )
                                  ),
                                  onPressed: () {
                                    controller.nextPage(
                                        duration:const  Duration(milliseconds: 300),
                                        curve: Curves.easeInOut);
                                  },
                                  child: const Text('Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.quiz.questions.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
