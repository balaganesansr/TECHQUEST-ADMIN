import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_admin/api_call.dart';
import 'package:quiz_admin/constants.dart';

class score_3 extends StatefulWidget {
  const score_3({super.key});

  @override
  State<score_3> createState() => _score_3State();
}

class _score_3State extends State<score_3> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getr3().whenComplete(() {
        setState(() {});
      });
      super.initState();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
                          Text("Scoreboard - Rapid Round",
                              style: GoogleFonts.poppins(
                                  fontSize: width(context) * 0.02,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 5),
              header(),
              SizedBox(height: 5),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: ro.length,
                  itemBuilder: ((context, index) {
                    return board(
                        teamname: ro[index]['teamname'],
                        sno: ro[index]['serial_number'],
                        score: ro[index]['score']);
                  }))
            ]))
      ]))
    ])));
  }
}

class board extends StatefulWidget {
  final sno, teamname, score;
  const board({super.key, this.sno, this.teamname, this.score});

  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.78,
            height: MediaQuery.of(context).size.height * 0.075,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.white,
              ),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 160,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(widget.sno,
                          style: GoogleFonts.readexPro(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 630,
                    child: Text(widget.teamname,
                        style: GoogleFonts.readexPro(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 130,
                    child: Text(widget.score,
                        style: GoogleFonts.readexPro(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            )),
      )
    ]);
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
          ],
        ),
      ),
    );
  }
}
