import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/constants/constants.dart';
import 'package:project/modules/healthy_foodInner/healthy_food_inner.dart';
import 'package:project/modules/home/home_screen.dart';

class HealthyFoodScreen extends StatelessWidget {
  const HealthyFoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: CustomColor.blue11,
            ),
            onPressed: ()
            {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return  HomeScreen();
                }),
              );
            },
          ),
          title: Text(
            'Healthy Food',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            SizedBox(
              height: 560.0,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      healthyFood.replaceAll('.', '.\n'),
                      style: const TextStyle(
                        height: 1.5,
                        color: Colors.black45,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 14.0,
              ),
              child: ElevatedButton(
                  onPressed: ()
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const HealtyFoodInnerScreen();
                      }),
                    );
                  },
                  child: const Text(
                      'Avoid That',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87
                    ),
                  ),
              ),
            ),
          ],
        )
    );
  }
}