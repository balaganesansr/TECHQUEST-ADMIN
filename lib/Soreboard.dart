import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_admin/api_call.dart';
import 'package:quiz_admin/constants.dart';

class scoreboard extends StatefulWidget {
  const scoreboard({super.key});

  @override
  State<scoreboard> createState() => _scoreboardState();
}

class _scoreboardState extends State<scoreboard> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      get_Score().whenComplete(() {
        setState(() {
          if (dropdownvalue == "Round 2") {
            score_round = "R2_Performance";
          } else {
            score_round = "R1_Performance";
          }
        });
      });
      super.initState();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  var items = ["Round 1", "Round 2"];
  var dropdownvalue = "Round 1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Container(
        height: height(context),
        width: width(context),
        child: Image.asset(
          'assets/bgimg.gif',
          fit: BoxFit.cover,
        ),
      ),
      Center(
          child: Column(children: [
        Container(
            height: height(context) * 0.98,
            width: width(context) * 0.8,
            decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(children: [
              Container(
                  width: double.infinity,
                  height: height(context) * 0.098,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Scoreboard",
                              style: GoogleFonts.poppins(
                                  fontSize: width(context) * 0.02,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600)),
                          Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          width: 3)),
                                  height: height(context) * 0.07,
                                  width: width(context) * 0.21,
                                  child: DropdownButton(
                                    value: dropdownvalue,
                                    iconEnabledColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    isExpanded: true,
                                    underline: Container(),
                                    dropdownColor:
                                        Color.fromARGB(0, 178, 178, 178)
                                            .withOpacity(0.5),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            items,
                                            style: GoogleFonts.poppins(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: ((value) {
                                      setState(() {
                                        dropdownvalue = value!;
                                      });
                                    }),
                                  ))),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 5),
              header(),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: score_board.length,
                  itemBuilder: ((context, index) {
                    return Scorecard(
                      index: index,
                      teamname: score_board[index]['teamname'].toString(),
                      sno: score_board[index]["serial"].toString(),
                      score: score_board[index]["score"].toString(),
                      time: score_board[index]["time"].toString(),
                    );
                  }))
            ]))
      ]))
    ])));
  }
}

class header extends StatelessWidget {
  const header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.78,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white.withOpacity(0.3),
          border: Border.all(color: Colors.white)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("S.No",
                style: GoogleFonts.actor(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            Text("Team Name",
                style: GoogleFonts.actor(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            Text("Score",
                style: GoogleFonts.actor(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            Text("Overall Seconds",
                style: GoogleFonts.actor(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class Scorecard extends StatelessWidget {
  final teamname, sno, score, time, index;
  const Scorecard({
    Key? key,
    required this.teamname,
    required this.sno,
    required this.score,
    required this.time,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.78,
        height: MediaQuery.of(context).size.height * 0.075,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: ((index + 1) % 2 == 0) ? Colors.white : Colors.white,
            ),
            color: ((index + 1) % 2 == 0)
                ? Colors.black.withOpacity(0.5)
                : Colors.black.withOpacity(0.5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 160,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(sno,
                      style: GoogleFonts.readexPro(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 290,
                child: Text(teamname,
                    style: GoogleFonts.readexPro(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                alignment: Alignment.center,
                width: 270,
                child: Text(score,
                    style: GoogleFonts.readexPro(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                width: 165,
                alignment: Alignment.centerRight,
                child: Text(time,
                    style: GoogleFonts.readexPro(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
