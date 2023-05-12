import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/modules/child_app/levels_screen/levels_screen.dart';

class BoardScreen extends StatefulWidget {
  BoardScreen({ Key? key, required this.board  , required this.index, }) : super(key: key);
  final dynamic board;
  int index ;

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  bool show = false ;
  PageController controller = PageController();

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
                top: 40.0,
               left: 5.0
            ),
            child: InkWell(
              onTap: ()
              {
                if(widget.index!=0){
                  setState(() {
                    widget.index--;
                  });
                  controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
                }else{
                  Navigator.pop(context);
                }

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
            padding: const EdgeInsets.only(left: 65.0),
            child: PageView.builder(
              controller: controller,
              itemCount: widget.board.names!.length,
              itemBuilder:(context,index)=> Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.width / 7,
                    left: 70,
                    child: SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Image.asset(
                        widget.board.shapes![widget.index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (show == true)
          Positioned(
            top: MediaQuery.of(context).size.width / 5,
            right: 150,
            child: Text(
              widget.board.names![widget.index],
              style: const TextStyle(
                fontSize: 70.0,
                fontWeight: FontWeight.w900,
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
                  if(widget.index!=widget.board.shapes.length-1){
                    setState(() {
                      widget.index++;
                    });
                    controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
                  }
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
