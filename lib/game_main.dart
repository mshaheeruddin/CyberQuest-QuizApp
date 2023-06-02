import 'package:cyberquest_isgame/components/ButtonWidget.dart';
import 'package:cyberquest_isgame/mission_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: IconButton(onPressed: () {
                }, icon: FaIcon(FontAwesomeIcons.arrowLeft)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 14),
            child: Text(
              "Welcome To CyberQuest Game",
              style: GoogleFonts.adventPro(fontSize: 30),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20),
            child: Text(
              "Select your role",
              style: GoogleFonts.adventPro(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => MissionSelectionScreen('Security Analyst')));
                },
                child: ButtonWidget('Security Analyst', Colors.blueGrey,Colors.black, 500,100)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget('Ethical Hacker', Colors.grey,Colors.black, 500,100),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget('Pen Tester', Colors.white30,Colors.black, 500,100),
          )

        ],
      ),
    );
  }
}
