import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/models/animal.dart';

import '../modules/child_app/content_screens/animals/animals.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'D',
          style: TextStyle(
            fontSize: 80,
            color: Color(0xff1CB0F6),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '21',
          style: TextStyle(
            fontSize: 60,
            color: Color(0xffFFC800),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0))
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: label,
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.black.withOpacity(.2),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(.2),
          ),
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  MainButton({Key? key, required this.label, this.width = double.infinity,this.onTap})
      : super(key: key);
  final String label;
  double width;
  dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      width: width,
      child: MaterialButton(
        height: 50,
        color: CustomColor.blue11,
        minWidth: double.infinity,
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 19,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomBorder extends StatelessWidget {
  const CustomBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      height: 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.black38,
            width: 1,
          )),
    );
  }
}

class TextEditorForPhoneVerify extends StatelessWidget {
  var last;

  var first;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value)
      {
        if(value.length == 1 && last == false)
        {
          FocusScope.of(context).nextFocus();
        }
        if(value.length == 1 && first == false)
        {
          FocusScope.of(context).nextFocus();
        }
      },
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      maxLength: 1,
      cursorColor: Colors.deepOrangeAccent,
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: '',
        hintStyle: TextStyle(
          color:Colors.deepOrange[600],
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class TextEditorForVerifyCode extends StatelessWidget {
  const TextEditorForVerifyCode({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      fieldWidth: 60.0,
      numberOfFields: 4,
      enabledBorderColor: Colors.grey,
      focusedBorderColor: CustomColor.sky,
      borderRadius: BorderRadius.circular(10),

      textStyle: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold
      ),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode)
        {

        }, // end onSubmit
    );
  }
}

class BloodKindBubble extends StatelessWidget {
  const BloodKindBubble({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 0)),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style:const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}

class DonorInfo extends StatelessWidget {
  const DonorInfo({
    Key? key,
    this.contact = false,
  }) : super(key: key);
  final bool contact;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black26,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 0)),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'B+',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fadya Ibrahim',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff4A4B4D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.link,
                          color: CustomColor.blue11,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          contact ? 'Contact The Donor' : 'Request For Blood',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black26,
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black12),
      child: Row(
        children: const [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/pic.png'),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'The Name',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class HealtyFoodComponent extends StatelessWidget {
  const HealtyFoodComponent({
    Key? key,
    required this.data,
    required this.pic,
  }) : super(key: key);
  final String data;
  final String pic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          data,
          style: const TextStyle(
            fontSize: 19,
            color: Colors.black54,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Image(
          image: AssetImage(pic),
          width: MediaQuery.of(context).size.width,
          height: 230,
          fit: BoxFit.contain,
        ),
        Container(
          margin: const EdgeInsets.only(
              top: 15,
          ),
          height: 1.0,
          color: Colors.black45,
        ),
      ],
    );
  }
}

class BuildMultiShadowContainer extends StatelessWidget {
  const BuildMultiShadowContainer({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      // height: 500,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: (width / 2) - width * .4,
            right: (width / 2) - width * .4,
            child: Container(
              height: 200,
              width: width * .4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.4),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: (width / 2) - width * .45,
            right: (width / 2) - width * .45,
            child: Container(
              height: 200,
              width: width * .45,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
                padding: const EdgeInsets.all(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: width - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: child),
          ),
        ],
      ),
    );
  }
}

class NumberComponent extends StatelessWidget {
  const NumberComponent({
    Key? key,
    required this.numbersModel,
    required this.index,
  }) : super(key: key);
  final AnimalsModel numbersModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      onTap: ()
      {

      },
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
            ),
          ],
        ),
        child: SvgPicture.asset(numbersModel.shapes[index]),
      ),
    );
  }
}

class PicAnswer extends StatelessWidget {
  PicAnswer({
    Key? key,
    required this.index,
    required this.model,
    this.right,
  }) : super(key: key);

  final AnimalsQuestion model;
  final int index;
  bool? right;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (model.answer == model.options[index]) {
          right = true;
        } else {
          right = false;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: model.answer == model.options[index]
                ? Colors.green
                : Colors.red,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(
                model.options[index],
              ),
              width: 100,
              height: 100,
            ),
            if (model.answer == model.options[index])
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
          ],
        ),
      ),
    );
  }
}

class TextAnswer extends StatefulWidget {
  TextAnswer({
    Key? key,
    required this.index,
    required this.model,
    this.right,
  }) : super(key: key);

  final AnimalsQuestion model;
  final int index;
  bool? right;

  @override
  State<TextAnswer> createState() => _TextAnswerState();
}

class _TextAnswerState extends State<TextAnswer> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.model.answer == widget.model.options[widget.index]) {
          setState(() {
            widget.right = true;
          });
        } else {
          setState(() {
            widget.right = false;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: widget.right == null
                ? Colors.grey
                : widget.right == true
                ? Colors.green
                : Colors.red,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.model.options[widget.index],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            if (widget.right == true)
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
          ],
        ),
      ),
    );
  }
}

class MultiChoiseQuestionComponent extends StatelessWidget {
  MultiChoiseQuestionComponent({
    Key? key,
    required this.model,
  }) : super(key: key);
  final AnimalsQuestion model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            model.text,
            style: TextStyle(
              fontSize: 22,
              color: CustomColor.blue11,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          if (model.pic.isNotEmpty)
            SizedBox(
              height: 200,
              child: Image(
                image: AssetImage(model.pic),
                fit: BoxFit.fill,
              ),
            ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView(
              children: List.generate(
                model.options.length,
                    (index) => model.kind == 'text'
                    ? TextAnswer(
                  index: index,
                  model: model,
                )
                    : PicAnswer(
                  index: index,
                  model: model,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  const UserMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage:
            AssetImage('assets/for_design/chat_bot_background.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'fine,thank you baby',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff192A3E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BotMessage extends StatelessWidget {
  const BotMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage:
            AssetImage('assets/for_design/chat_bot_background.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'how you doing',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff192A3E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}










