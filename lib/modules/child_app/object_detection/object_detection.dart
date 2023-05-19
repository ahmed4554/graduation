import 'dart:io';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/child_app/home_Screen/home_screen.dart';
import 'package:project/network/dio_helper/dio_helper.dart';

class ObjectDetectionScreen extends StatefulWidget {
  const ObjectDetectionScreen({Key? key}) : super(key: key);

  @override
  State<ObjectDetectionScreen> createState() => _GallatyScreenState();
}

class _GallatyScreenState extends State<ObjectDetectionScreen>
    with SingleTickerProviderStateMixin {
  var image;

  final imagePicker = ImagePicker();

  uploadImage() async {
    var pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 200,
      maxWidth: 200,
    );

    if (pickedImage != null) {
      log(pickedImage.path);
      File image = File(pickedImage.path);
      log(image.path);
      FormData data = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last)
      });
      // log(data.files.length);
      DioHelper.uploudImageToDetect(data);
    } else {}
  }

  uploadGImage() async {
    var pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 200,
      maxWidth: 200,
    );

    if (pickedImage != null) {
      File image = File(pickedImage.path);
      FormData data = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });

      log(data.files[0].key.toString());
      try {
        Response response = await DioHelper.uploudImageToDetect(data);
        print(response.data);
      } catch (e) {
        print(e);
      }
    } else {}
  }

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
    DioHelper.initDio();
    super.initState();
  }

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
            style: Theme.of(context).textTheme.titleLarge,
          ),
          elevation: 0,
          backgroundColor: CustomColor.blue11,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'click the button below to open the camera or gallery :'
                    .toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Lottie.asset(
                'assets/lotties/object_detection.json',
              ),
            ),
          ],
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
              onPress: uploadImage,
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
                onPress: uploadGImage),
          ],

          // animation controller
          animation: animation,

          // On pressed change animation state
          onPress: () => animationController.isCompleted
              ? animationController.reverse()
              : animationController.forward(),

          // Floating Action button Icon color
          iconColor: CustomColor.blue11,

          // Flaoting Action button Icon
          iconData: Icons.photo,
          backGroundColor: Colors.white,
        ));
  }
}
