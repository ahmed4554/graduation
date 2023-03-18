import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:project/components/custom_color.dart';

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





