import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/child_app/levelOne_screen/level1_screen.dart';
import 'package:project/modules/child_app/levelTwo_screen/level2_screen.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  int currentStep = 0;

  continueStep() {
    if (currentStep < 3)
      setState(() {
        currentStep = currentStep + 1;
      });
  }

  cancelStep() {
    if (currentStep > 0)
      setState(() {
        currentStep = currentStep - 1;
      });
  }

  tapStep(int value) {
    setState(() {
      currentStep = value;
    });
  }

  Widget controlsBuilder(context, details) {
    return Row(
      children:
      [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: CustomColor.blue11.withOpacity(.8),
            padding: const EdgeInsets.symmetric(horizontal: 50),

          ),
          onPressed: details.onStepContinue,
          child: Text(
            'Next',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        OutlinedButton(
          onPressed: details.onStepCancel,
          child: Text(
            'Back',
            style: TextStyle(
                color: CustomColor.sky1
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColor.blue11.withOpacity(.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'Education Levels',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children:
        [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .6,
            // height: 350.0,
            decoration: BoxDecoration(
              // color: CustomColor.blue11.withOpacity(.8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomColor.blue11.withOpacity(.8),
                  Colors.white,
                ],
                stops: const [.4,.6],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 20.0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset.zero,
                      )
                    ],
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    'Let\'s Study',
                    style: TextStyle(
                        fontSize: 26.0, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 102.0,
                  height: 102.0,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset.zero,
                        )
                      ],
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Image.asset(
                    "assets/images/profile/eliza.png",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 180,
            ),
            child: Stepper(
              currentStep: currentStep,
              onStepContinue: continueStep,
              onStepCancel: cancelStep,
              onStepTapped: tapStep,
              controlsBuilder: controlsBuilder,
              type: StepperType.vertical,
              steps: getSteps(),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> getSteps() =>
      [
        Step(
          isActive: currentStep >= 0,
          title: Text(
            'Step 1',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          content: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LevelOneScreen(),
              ));
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 10,
                  bottom: 10,
              ),
              child: Stack(
                children:
                [
                  Container(
                    width: 319.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: CustomColor.deepBlue,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.6),
                            spreadRadius: 5.0,
                            blurRadius: 7.0,
                            offset: Offset(1.5, 3)
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 15.0,
                    ),
                    child: SizedBox(
                      width: 280.0,
                      child: LinearProgressIndicator(
                        minHeight: 8.0,
                        color: Colors.deepOrange.shade500.withOpacity(.9),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 90.0,
                      left: 16.0,
                    ),
                    child: Text(
                      'Level 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 120.0,
                      left: 16.0,
                    ),
                    child: Text(
                      'Basic',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 39.1,
                      left: 72.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15.0)
                      ),
                      child: Image.asset(
                        'assets/images/child_app/levels_screen/one.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          state: currentStep >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          isActive: currentStep >= 1,
          title: Text(
            'Step 2',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          content: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LevelTwoScreen(),
              ));
            },
            child: Container(
              margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
              ),

              child: Stack(
                children:
                [
                  Container(
                    width: 319.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: CustomColor.sky1,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.6),
                            spreadRadius: 5.0,
                            blurRadius: 7.0,
                            offset: Offset(1.5, 3)
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 14.0,
                    ),
                    child: SizedBox(
                      width: 280.0,
                      child: LinearProgressIndicator(
                        minHeight: 8.0,
                        color: Colors.deepOrange.shade500.withOpacity(.9),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 90.0,
                      left: 16.0,
                    ),
                    child: Text(
                      'Level 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 120.0,
                      left: 16.0,
                    ),
                    child: Text(
                      'Basic',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 109.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15.0)
                      ),
                      child: Image.asset(
                        'assets/images/child_app/levels_screen/two.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          state: currentStep >= 1 ? StepState.complete : StepState.disabled,
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text(
            'Step 3',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          content: Container(
            margin: const EdgeInsets.only(
                top:10,
                bottom: 10,
            ),

            child: Stack(
              children:
              [
                Container(
                  width: 319.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: CustomColor.teal,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.6),
                          spreadRadius: 5.0,
                          blurRadius: 7.0,
                          offset: Offset(1.5, 3)
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 90.0,
                    left: 16.0,
                  ),
                  child: Text(
                    'Level 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 120.0,
                    left: 16.0,
                  ),
                  child: Text(
                    'Basic',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 7.0,
                    left: 67.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)
                    ),
                    child: Image.asset(
                      'assets/images/child_app/levels_screen/three.png',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 14.0,
                  ),
                  child: SizedBox(
                    width: 280.0,
                    child: LinearProgressIndicator(
                      minHeight: 8.0,
                      color: Colors.deepOrange.shade500.withOpacity(.9),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          state: currentStep >= 2 ? StepState.complete : StepState.disabled,
        ),
        Step(
          isActive: currentStep >= 3,
          title: Text(
            'Step 4',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          content: Container(
            margin: const EdgeInsets.only(
                top:10,
                bottom: 10,
            ),
            child: Stack(
              children:
              [
                Container(
                  width: 319.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: CustomColor.teal1,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.6),
                          spreadRadius: 5.0,
                          blurRadius: 7.0,
                          offset: Offset(1.5, 3)
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 90.0,
                    left: 16.0,
                  ),
                  child: Text(
                    'Activity',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 120.0,
                    left: 16.0,
                  ),
                  child: Text(
                    'lvl 1,2,3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 39.1,
                    left: 72.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0)
                    ),
                    child: Image.asset(
                      'assets/images/child_app/levels_screen/one.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          state: currentStep >= 3 ? StepState.complete : StepState.disabled,
        ),
      ];
}
