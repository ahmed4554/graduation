// import 'package:flutter/material.dart';
// import 'package:project/components/custom_color.dart';
// import 'package:project/constants/constants.dart';
// import 'package:project/modules/healthy_foodInner/healthy_food_inner.dart';
// import 'package:project/modules/home/home_screen.dart';
//
// class HealthyFoodScreen extends StatelessWidget {
//   const HealthyFoodScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: CustomColor.blue11,
//             ),
//             onPressed: ()
//             {
//               Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) {
//                   return  HomeScreen();
//                 }),
//               );
//             },
//           ),
//           title: Text(
//             'Healthy Food',
//             style: Theme.of(context).textTheme.titleLarge!.copyWith(
//               color: Colors.black,
//               fontWeight: FontWeight.bold
//             ),
//           ),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children:
//           [
//             SizedBox(
//               height: 560.0,
//               child: ListView(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Text(
//                       healthyFood.replaceAll('.', '.\n'),
//                       style: const TextStyle(
//                         height: 1.5,
//                         color: Colors.black45,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 14.0,
//               ),
//               child: ElevatedButton(
//                   onPressed: ()
//                   {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) {
//                         return const HealtyFoodInnerScreen();
//                       }),
//                     );
//                   },
//                   child: const Text(
//                       'Avoid That',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       color: Colors.black87
//                     ),
//                   ),
//               ),
//             ),
//           ],
//         )
//     );
//   }
// }

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/healthy_foodInner/healthy_food_inner.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:project/modules/main_page/main_page.dart';

class HealthyFoodScreen extends StatelessWidget {
   HealthyFoodScreen({Key? key}) : super(key: key);
  List<String> titles = [
    'The American Academy of Pediatrics’ Committee on Genetics has noted that those with Down syndrome are likely to develop certain health problems. This is thought to happen as a result of body structures not developing normally.',
    'Children with Down syndrome are likely to be overweight and have a higher risk of obesity. They burn calories at a slower rate and are frequently diagnosed with an under-active thyroid which can contribute to weight gain.',
    'Gastro-esophageal reflux disease (GERD) is common among children with Down syndrome.  Symptoms include heartburn, sore throat, regurgitation and chest pain.',
    'Gluten intolerance and celiac disease is also widespread and can lead to nutrient deficiency and an impaired immune system if dietary needs are avoided.'
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children:
        [
          Container(
            height: height * .25,
            width: width,
            decoration: BoxDecoration(
              color: CustomColor.blue11.withOpacity(.6),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
            ),
            child: Stack(
              children:
              [
                const Positioned(
                  top: 70.0,
                  left: 160.0,
                  child: Text(
                    'Healthy Food',
                    style: TextStyle(
                      fontSize: 37.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunitob'
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    SizedBox(
                      width: 300,
                      height: 290,
                      child: Image.asset(
                          fit: BoxFit.fitWidth,
                          'assets/images/healthy/fruit-salad-juice-bowl-food-fruit-dish-48d253d26dd37c9dffebe269fcc69bc3.png'),
                    ),
                    InkWell(
                      onTap: ()
                      {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HealthyFoodInnerScreen()));
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  color: Colors.grey.shade400,
                                  blurRadius: 5,
                                  offset: const Offset(1, 1),
                                  // inset: true
                                ),
                              ],
                              color: Colors.white),
                          child: const Icon(
                            Icons.arrow_forward_outlined,
                            color: CustomColor.blue11,
                            size: 50,
                          ),
                      ),
                    )
                  ],
              ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                  ),
                  child: IconButton(
                    onPressed: ()
                    {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Transform.rotate(
                angle: 35,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  height: height * .35,
                  width: width * .8,
                  margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black26),
                    borderRadius: BorderRadius.circular(60),
                    boxShadow:const  [
                      BoxShadow(
                        spreadRadius: 0,
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(-10, -10),
                        // inset: true
                      ),
                    ],
                    color: Colors.grey.shade300,
                  ),
                  child: Transform.rotate(
                    angle: -35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(
                          '${index + 1}:',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.blue11,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${titles[index]}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),),
                ),
              ),
              itemCount: titles.length,
            ),
          ),
        ],
      ),
    );
  }
}
