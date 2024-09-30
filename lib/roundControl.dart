import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_admin/api_call.dart';
import 'package:quiz_admin/constants.dart';

class roundcontrol extends StatefulWidget {
  const roundcontrol({super.key});

  @override
  State<roundcontrol> createState() => _roundcontrolState();
}

class _roundcontrolState extends State<roundcontrol> {
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
                          Text("Round Control",
                              style: GoogleFonts.poppins(
                                  fontSize: width(context) * 0.02,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 30),
              Expanded(
                child: SizedBox(
                  height: 700,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        return Roundwidget(
                          text: rounds[index],
                          color: Colors.red,
                          button: "Start",
                          index: index,
                        );
                      })),
                ),
              )
            ]))
      ]))
    ])));
  }
}

class Roundwidget extends StatelessWidget {
  final text, button, color, index;
  const Roundwidget({Key? key, this.text, this.button, this.color, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        children: [
          Container(
              height: height(context) * 0.5,
              width: width(context) * 0.2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.transparent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  SizedBox(height: 40),
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
                  Text(text,
                      style: GoogleFonts.readexPro(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 20),
                  MaterialButton(
                      onPressed: () {
                        if (index == 0) {
                          update_round("R1").whenComplete(() {
                            showAlertDialog(
                                context, "Info", "Sucessfully Started");
                          });
                        } else if (index == 1) {
                          update_round("R2").whenComplete(() {
                            showAlertDialog(
                                context, "Info", "Sucessfully Started");
                          });
                        } else if (index == 2) {
                          update_round("R3").whenComplete(() {
                            showAlertDialog(
                                context, "Info", "Sucessfully Started");
                          });
                        }
                      },
                      child: Text(button,
                          style: GoogleFonts.readexPro(color: Colors.white)),
                      color: color),
                ],
              )),
        ],
      ),
    );
  }
}
