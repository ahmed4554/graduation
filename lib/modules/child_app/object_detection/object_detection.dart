import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/child_app/home_Screen/home_screen.dart';
import 'package:project/network/dio_helper/dio_helper.dart';
import 'package:project/utils/cubits/data_cubit/data_cubit.dart';
import 'package:project/utils/cubits/data_cubit/data_states.dart';

class ObjectDetectionScreen extends StatefulWidget {
  const ObjectDetectionScreen({Key? key}) : super(key: key);

  @override
  State<ObjectDetectionScreen> createState() => _GallatyScreenState();
}

class _GallatyScreenState extends State<ObjectDetectionScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: animationController);
    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    // initialize dio object
    DioDetectionHelper.initDio();
    super.initState();
  }

  List<double> boxCordinates = [];
  double width = 0;
  double height = 0;
  num classPercentage = 0;
  String className = '';
  Radius noRadius = Radius.zero;
  Radius radius = const Radius.circular(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(
                MaterialPageRoute(builder: (context) {
                  return const ChildHomeScreen();
                }),
              );
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "Object Detection",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          elevation: 0,
          backgroundColor: CustomColor.blue11,
        ),
        body: BlocConsumer<DataCubit, DataStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var c = DataCubit.get(context);
            if (c.objectDetection != null)
            {
              boxCordinates =
                  c.objectDetection!.results![0].entities![0].objects![0].box!;
              className = c.objectDetection!.results![0].entities![0]
                  .objects![0].entities![0].classes!.keys
                  .toList()[0];
              classPercentage = (c.objectDetection!.results![0].entities![0]
                          .objects![0].entities![0].classes!.values.first *
                      100)
                  .round();
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Click the button below to open the camera or gallery :',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                          fontFamily: 'Nunito'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    width: 400.0,
                    height: 500.0,
                    child: Stack(
                            children:
                            [
                              if(c.image == null)
                              Positioned(
                                child: LottieBuilder(
                                  width: 600.0,
                                  height: 600.0,
                                  fit: BoxFit.fill,
                                  lottie: AssetLottie(
                                    'assets/lotties/confused.json',
                                  ),
                                ),
                              ),
                              if(c.image!=null)
                              Image(
                                width: 400,
                                height: 500,
                                image: FileImage(
                                  c.image!,
                                ),
                                fit: BoxFit.fill,
                              ),
                              if(state is ObjectDetectionLoading)
                                Positioned(
                                    child: LottieBuilder(
                                      width: 400.0,
                                      height: 500.0,
                                      fit: BoxFit.fill,
                                      lottie: AssetLottie(
                                          'assets/lotties/scan.json',
                                      ),
                                    ),
                                ),
                              if(state is ObjectDetectionSuccess)
                                Positioned(
                                left: 400 * boxCordinates[0],
                                top: 500 * boxCordinates[1] - 30,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      topLeft: radius,
                                      topRight: radius,
                                      bottomLeft: noRadius,
                                      bottomRight: noRadius,
                                    ),
                                  ),
                                  child: Text(
                                    '$className : $classPercentage %',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              if(state is ObjectDetectionSuccess)
                                Positioned(
                                left: 400 * boxCordinates[0],
                                top: 500 * boxCordinates[1],
                                child: Container(
                                  width: 450 * boxCordinates[2],
                                  height: 500 * boxCordinates[3],
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: noRadius,
                                      topRight: radius,
                                      bottomLeft: radius,
                                      bottomRight: radius,
                                    ),
                                    border: Border.all(
                                      color: Colors.yellow,
                                      width: 3.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                       ),
                   ),
                ],
              ),
            );
          },
        ),
        //Init Floating Action Bubble
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title: "Camera",
              iconColor: Colors.white,
              bubbleColor: CustomColor.blue11,
              icon: Icons.camera_alt,
              titleStyle: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
              onPress: DataCubit.get(context).uploadImage,
            ),
            // Floating action menu item
            Bubble(
                title: "Gallery",
                iconColor: Colors.white,
                bubbleColor: CustomColor.blue11,
                icon: Icons.photo_album,
                titleStyle: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                onPress: DataCubit.get(context).uploadGImage),
          ],

          // animation controller
          animation: animation,

          // On pressed change animation state
          onPress: () {
            animationController.isCompleted
                ? animationController.reverse()
                : animationController.forward();
          },

          // Floating Action button Icon color
          iconColor: CustomColor.blue11,

          // Floating Action button Icon
          iconData: Icons.photo,
          backGroundColor: Colors.white,
        ));
  }
}
