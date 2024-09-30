import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_admin/api_call.dart';
import 'package:quiz_admin/constants.dart';

class questionControl extends StatefulWidget {
  const questionControl({super.key});

  @override
  State<questionControl> createState() => _questionControlState();
}

class _questionControlState extends State<questionControl> {
  int i = 0;
  var count = "0", completed = "NO", answer = "NO";
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getQues().whenComplete(() {
        print(rapidinfo);
        setState(() {
          i = int.parse(cur_ques[0]['question_no']);
          getr3info(i.toString()).whenComplete(() {
            rapidinfo[0]['answer'] == "0" || rapidinfo[0]['answer'] == null
                ? answer = "NO"
                : answer = "YES";

            rapidinfo[0]['attempted'] == rapidinfo[0]['total']
                ? completed = "YES"
                : completed = "NO";
            rapidinfo[0]['attempted'] == "0" ||
                    rapidinfo[0]['attempted'] == null
                ? completed = "NO"
                : completed = "YES";
          });
        });
      });
    });
    super.initState();
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text("Question Control",
                                style: GoogleFonts.poppins(
                                    fontSize: width(context) * 0.02,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600)),
                          ])))),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: height(context) * 0.6,
                  width: width(context) * 0.3,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.transparent.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 64,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(
                              'https://cdn.dribbble.com/userupload/3638418/file/original-27458ba57c56b1872d898d64af0ac887.png?compress=1&resize=752x'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("RAPID ROUND",
                          style: GoogleFonts.readexPro(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 10),
                      Text(i.toString(),
                          style: GoogleFonts.readexPro(
                              fontSize: 70,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                              onPressed: () {
                                if (i != 20) {
                                  setState(() {
                                    i = i + 1;
                                    update_qno(i);
                                  });
                                }
                              },
                              child: Text("Next >",
                                  style: GoogleFonts.readexPro(
                                      color: Colors.white)),
                              color: Colors.blue)
                        ],
                      )
                    ],
                  )),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "Attempt Count :   ",
                        style: GoogleFonts.actor(
                            color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        rapidinfo[0]['attempted'] == null
                            ? "0"
                            : rapidinfo[0]['attempted'],
                        //rapidinfo[0]['attempted'],
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    "Answered :   " + answer,
                    style: GoogleFonts.actor(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "Member Completed :   " + completed,
                    style: GoogleFonts.actor(color: Colors.white, fontSize: 20),
                  )
                ],
              )
            ]))
      ]))
    ])));
  }
}
