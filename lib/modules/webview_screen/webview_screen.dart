import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key,required this.lat,required this.long}) : super(key: key);

  final String lat ;
  final String long ;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var controller ;

  @override
  void initState() {
    controller = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse('https://www.google.com/maps/search/?api=1&query=${widget.lat},${widget.long}'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff1CB0F6),
              Color(0xffd0e7fc),
            ],
          ),
        ),
        child: Column(
          children:
          [
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 45.0,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  const SizedBox(
                    width: 90.0,
                  ),
                  Text(
                    'Donor Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: WebViewWidget(
                  controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
