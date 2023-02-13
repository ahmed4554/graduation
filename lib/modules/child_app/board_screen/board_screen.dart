import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/modules/child_app/content_screens/animals/animals.dart';
import 'package:project/modules/child_app/content_screens/shapes/shapes.dart';
import 'package:project/modules/child_app/content_screens/shapes/shapes_screen.dart';
import 'package:project/modules/child_app/levels_screen/levels_screen.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({ Key? key, required this.board  , required this.index, }) : super(key: key);
  final dynamic board;
  final int index ;

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  bool show = false ;

  @override
  void initState() {
    Timer(Duration(seconds: 2 ),
        ()=> setState(() {
          show = true;
        })
    );
    super.initState();
  }
  @override
  void dispose() {
    setState(() {
      SystemChrome.setPreferredOrientations(
          [
            DeviceOrientation.portraitUp,
          ]
      );
    });
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
                'assets/images/child_app/board/land.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 34.0,
              left: 10.0
            ),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    SystemChrome.setPreferredOrientations(
                        [
                          DeviceOrientation.portraitUp,
                        ]);
                    return LevelsScreen();
                  },
                ),
              );
            },
              child: Image.asset(
                  'assets/images/child_app/board/back.png',
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 45.0,
                right: 20.0
              ),
              child: Container(
                width: 693.0,
                height: 340.0,
                child: Image.asset(
                    'assets/images/child_app/board/board.png'
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 110.0,
              left: 120.0,
            ),
            child: SizedBox(
              width: 160.0,
              height: 160.0,
              child: Image.asset(
                widget.board.shapes![widget.index],
              ),
            ),
          ),
          if (show == true)
          Padding(
            padding: const EdgeInsets.only(
              top: 110.0,
              left: 500.0,
            ),
            child: SizedBox(
              width: 160.0,
              height: 160.0,
              child: Image.asset(
                widget.board.pictures![widget.index],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 740.0,
              ),
              child: InkWell(
                onTap: ()
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return BoardScreen(board: widget.board, index: widget.index+1);
                  }));
                },
                child: Image.asset(
                    'assets/images/child_app/board/next.png',
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
