import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60.0,
          left: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Row(
              children:
              [
                Icon(Icons.arrow_back_ios_new),
                SizedBox(
                  width: 14.0,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 27.0
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: SizedBox(
                width: 314.0,
                child: Divider(
                  color: CustomColor.green,
                  thickness: .5,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children:
              [
                SizedBox(
                  width: 20.0,
                  height: 22.31,
                  child: Image.asset(
                      'assets/images/settings/ring.png',
                  ),
                ),
                SizedBox(
                  width: 26.0,
                ),
                Text(
                  'Notification',
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children:
              [
                SizedBox(
                  width: 20.0,
                  height: 22.31,
                  child: Image.asset(
                      'assets/images/settings/about.png',
                  ),
                ),
                SizedBox(
                  width: 26.0,
                ),
                Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children:
              [
                SizedBox(
                  width: 20.0,
                  height: 22.31,
                  child: Image.asset(
                      'assets/images/settings/help.png',
                  ),
                ),
                SizedBox(
                  width: 26.0,
                ),
                Text(
                  'Help',
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children:
              [
                SizedBox(
                  width: 20.0,
                  height: 22.31,
                  child: Image.asset(
                      'assets/images/settings/friend.png',
                  ),
                ),
                SizedBox(
                  width: 26.0,
                ),
                Text(
                  'Invite Friends',
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children:
              [
                SizedBox(
                  width: 20.0,
                  height: 22.31,
                  child: Image.asset(
                      'assets/images/settings/logout.png',
                  ),
                ),
                SizedBox(
                  width: 26.0,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 36.0,
            ),
          ],
        ),
      ),
    );
  }
}
