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
  continueStep (){
    if (currentStep < 3)
    setState(() {
      currentStep = currentStep + 1 ;
    });
  }
  cancelStep(){
    if (currentStep > 0)
    setState(() {
      currentStep = currentStep - 1 ;
    });
  }
  tapStep(int value){
    setState(() {
      currentStep = value;
    });
  }

  Widget controlsBuilder(context,details){
    return Row(
      children:
      [
        MaterialButton(
          color: CustomColor.sky1,
            height: 33.0,
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
      body: Stack(
        children:
        [
          Container(
            width: double.infinity,
            height: 270.0,
            decoration: BoxDecoration(
                color:CustomColor.blue11.withOpacity(.8),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(110.0),
                  bottomLeft: Radius.circular(110.0),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 45.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Row(
                  children:
                  [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 100.0,
                    ),
                    Text(
                      'Education',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  children:
                  [
                    Text(
                      'Let\'s study',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 210.0,
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

  List<Step> getSteps() =>[
    Step(
      isActive: currentStep>=0,
      title: Text(
          'Step 1',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600
        ),
      ),
      content: InkWell(
        onTap: ()
            {
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  LevelOneScreen(),
              ));
            },
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
                      offset: Offset(1.5 , 3)
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
      state: currentStep>=0 ? StepState.complete : StepState.disabled,
    ),
    Step(
      isActive: currentStep>=1,
      title: Text(
          'Step 2',
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600
        ),
      ),
      content: InkWell(
        onTap: ()
        {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  LevelTwoScreen(),
          ));
        },
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
                      offset: Offset(1.5 , 3)
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
      state: currentStep>=1 ? StepState.complete : StepState.disabled,
    ),
    Step(
      isActive: currentStep>=2,
      title: Text(
          'Step 3',
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600
        ),
      ),
      content: Stack(
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
                    offset: Offset(1.5 , 3)
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
      state: currentStep>=2 ? StepState.complete : StepState.disabled,
    ),
    Step(
      isActive: currentStep>=3,
      title: Text(
          'Step 4',
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600
        ),
      ),
      content: Stack(
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
                    offset: Offset(1.5 , 3)
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
      state: currentStep>=3 ? StepState.complete : StepState.disabled,
    ),
  ];
}
