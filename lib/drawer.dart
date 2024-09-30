import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_admin/R2_Questions.dart';
import 'package:quiz_admin/R3Scoreboard.dart';
import 'package:quiz_admin/Soreboard.dart';
import 'package:quiz_admin/questionCOntrol.dart';
import 'package:quiz_admin/roundControl.dart';
import 'package:quiz_admin/team_entry.dart';
import 'package:quiz_admin/api_call.dart';
import 'package:quiz_admin/R1_Questions.dart';
import 'package:side_navigation/side_navigation.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  List<Widget> views = [
    admin(),
    quiz(
      round1: true,
    ),
    r2Question(),
    const quiz(round1: false),
    const scoreboard(),
    const score_3(),
    const questionControl(),
    const roundcontrol()
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text("QUIZ EVENT",
                style: GoogleFonts.robotoSlab(
                    fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255))),
          ),
        ],
        title: Text("MZCET NATIONAL LEVEL TECHNICAL SYMPOSIYUM - 2023",
            style: GoogleFonts.robotoSlab(
                color: Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Row(
        children: [
          SideNavigationBar(
            expandable: true,
            theme: SideNavigationBarTheme(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              togglerTheme: SideNavigationBarTogglerTheme.standard(),
              itemTheme: SideNavigationBarItemTheme(
                  unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
                  selectedItemColor: Colors.white,
                  iconSize: 32.5,
                  labelTextStyle:
                      const TextStyle(fontSize: 15, color: Colors.black)),
              dividerTheme: SideNavigationBarDividerTheme.standard(),
            ),
            selectedIndex: selectedIndex,
            items: [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'TEAM VERIFICATION',
              ),
              SideNavigationBarItem(
                icon: Icons.quiz,
                label: 'MCQ QUIZ',
              ),
              SideNavigationBarItem(
                icon: Icons.image_search_sharp,
                label: 'PICTURE QUIZ',
              ),
              SideNavigationBarItem(
                icon: Icons.fireplace_sharp,
                label: 'RAPID FIRE',
              ),
              SideNavigationBarItem(
                icon: Icons.bar_chart,
                label: 'SCOREBOARD',
              ),
              SideNavigationBarItem(
                icon: Icons.stacked_bar_chart_rounded,
                label: 'RAPID SCOREBOARD',
              ),
              SideNavigationBarItem(
                icon: Icons.question_answer,
                label: 'QUESTION CONTROL',
              ),
              SideNavigationBarItem(
                icon: Icons.radar_outlined,
                label: 'ROUND CONTROL',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
