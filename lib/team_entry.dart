import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_admin/api_call.dart';
import 'package:quiz_admin/constants.dart';

class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  late Timer _timer;
  StreamController login = StreamController();
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        get_login();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    login.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder(
              stream: login.stream,
              builder: (context, snapshot) {
                return Stack(children: [
                  Container(
                      height: hei,
                      width: wid,
                      child: Image.asset(
                        'assets/bgimg.gif',
                        fit: BoxFit.cover,
                      )),
                  SingleChildScrollView(
                    child: Container(
                      height: hei,
                      width: wid,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: wid * 0.00078,
                            crossAxisCount:
                                MediaQuery.of(context).size.shortestSide < 900
                                    ? 3
                                    : 2,
                          ),
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: teams.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  color: Colors.transparent.withOpacity(0.5),
                                  child: Column(
                                    children: [
                                      SizedBox(height: hei * 0.04),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 40,
                                          child: CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                'https://cdn.dribbble.com/userupload/3638418/file/original-27458ba57c56b1872d898d64af0ac887.png?compress=1&resize=752x'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Text(teams[index]["Teamname"],
                                          style: GoogleFonts.poppins(
                                              fontSize: wid * 0.02,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      teams[index]["Status"] == "0"
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                MaterialButton(
                                                    color: Colors.blue,
                                                    onPressed: () {
                                                      team_id = int.parse(
                                                          teams[index]["id"]);
                                                      update_login();
                                                    },
                                                    child: Text("Allow",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: wid *
                                                                    0.01))),
                                                MaterialButton(
                                                    color: Colors.red,
                                                    onPressed: () {
                                                      team_id = int.parse(
                                                          teams[index]["id"]);
                                                      delete_login();
                                                    },
                                                    child: Text("Decline",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: wid *
                                                                    0.01))),
                                              ],
                                            )
                                          : Container(
                                              width: width(context) * 0.1,
                                              color: Colors.green,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text("Approved",
                                                        style: GoogleFonts.aleo(
                                                            color: Colors.white,
                                                            fontSize: 13))
                                                  ],
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ]);
              }),
        ],
      ),
    );
  }
}
