import 'package:cyberquest_isgame/components/ButtonWidget.dart';
import 'package:cyberquest_isgame/components/ButtonWidgetForMissions.dart';
import 'package:cyberquest_isgame/components/Mission1Button.dart';
import 'package:cyberquest_isgame/components/Mission2Button.dart';
import 'package:cyberquest_isgame/components/Mission3Button.dart';
import 'package:cyberquest_isgame/mission_screens/security_analyst_mission1/mission1_secanalyst.dart';
import 'package:cyberquest_isgame/mission_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MissionSelectionScreen extends StatefulWidget {
  String missionSelected;

  MissionSelectionScreen(this.missionSelected);

  @override
  State<MissionSelectionScreen> createState() =>
      _MissionSelectionScreenState();
}

class _MissionSelectionScreenState extends State<MissionSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF304FFE), Color(0xFF0000FF)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    // Add functionality for back button
                  },
                  icon: FaIcon(FontAwesomeIcons.arrowLeft),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Select Mission",
                style: GoogleFonts.adventPro(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Each mission has increased level of difficulty!!",
              style: GoogleFonts.adventPro(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SecAnalystMission1(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Mission1Button(
                  'Mission 1',
                  Colors.green,
                  Colors.black,
                  500,
                  100,
                  widget.missionSelected,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Mission2Button(
                'Mission 2',
                Colors.deepOrange,
                Colors.black,
                500,
                100,
                widget.missionSelected,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Mission3Button(
                'Mission 3',
                Colors.red,
                Colors.black,
                500,
                100,
                widget.missionSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
