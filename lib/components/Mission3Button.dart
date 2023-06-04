import 'package:cyberquest_isgame/mission_screens/ethical_hacker_missions/mission3_ethicalhacker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../mission_screens/pen_tester_missions/mission3_pentester.dart';
import '../mission_screens/security_analyst_missions/mission1_secanalyst.dart';
import '../mission_screens/security_analyst_missions/mission3_secanalyst.dart';
import '../mission_selection.dart';




class Mission3Button extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Color textColor;
  double width;
  double height;
  String role;
  Mission3Button(this.buttonText,this.buttonColor,this.textColor, this.width,this.height, this.role);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        if(role == "Security Analyst") {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => SecAnalystMission3())); }

        if(role == "Ethical Hacker") {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => EthicalHackerMission3())); }

        if(role == "Pen Tester") {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => PenTesterMission3())); }
      },
      icon: Padding(
        padding: EdgeInsets.only(left: 14),
        child: Text(buttonText,
            style: TextStyle(color: textColor, fontSize: 20)),
        /*FaIcon(
          FontAwesomeIcons.facebook,
          color: Colors.white,
        ),*/
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor:buttonColor,
        fixedSize: Size(width, height),
      ), label: Text(''),
    );
  }
}





