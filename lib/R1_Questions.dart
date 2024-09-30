import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_admin/api_call.dart';
import 'package:quiz_admin/constants.dart';
import 'package:quiz_admin/loading.dart';
import 'package:quiz_admin/textfield.dart';

class quiz extends StatefulWidget {
  final bool round1;

  const quiz({required this.round1});

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  final _formKey = GlobalKey<FormState>();
  bool imageSubmit = true;
  bool finish = false;

  var items = ['A', 'B', 'C', 'D'];
  var item1 = [
    'select-question',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
  ];

  bool? finsh;
  String dropdownvalue = 'A';
  String dropdownvalue1 = 'select-question';
  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController(text: "A. ");

  TextEditingController option2 = TextEditingController(text: "B. ");

  TextEditingController option3 = TextEditingController(text: "C. ");

  TextEditingController option4 = TextEditingController(text: "D. ");

  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Container(
          height: hei,
          width: wid,
          child: Image.asset(
            'assets/bgimg.gif',
            fit: BoxFit.cover,
          ),
        ),
        Center(
            child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
                height: hei * 0.98,
                width: wid * 0.8,
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: hei * 0.098,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.round1 ? "Quiz Round" : "Rapid Round",
                                  style: GoogleFonts.poppins(
                                      fontSize: wid * 0.02,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0, right: 10),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text("Question  :",
                                          style: GoogleFonts.poppins(
                                              fontSize: wid * 0.018,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    SizedBox(width: wid * 0.07),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                                width: 3)),
                                        height: hei * 0.07,
                                        width: wid * 0.18,
                                        child: DropdownButton(
                                            value: dropdownvalue1,
                                            iconEnabledColor: Colors.white,
                                            isExpanded: true,
                                            underline: Container(),
                                            dropdownColor: Colors.transparent
                                                .withOpacity(0.5),
                                            items: widget.round1
                                                ? item1.map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          items,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList()
                                                : items2.map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          items,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalue1 = newValue!;
                                              });
                                            }))
                                  ],
                                ),
                                SizedBox(height: hei * 0.04),
                                Textfield(
                                  wid: wid,
                                  width: 0.35,
                                  maxline: 5,
                                  context: context,
                                  label: 'Question',
                                  controller: question,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Questions";
                                    }
                                  },
                                ),
                                SizedBox(height: hei * 0.08),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text("Answer  :",
                                          style: GoogleFonts.poppins(
                                              fontSize: wid * 0.018,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    SizedBox(width: wid * 0.07),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              width: 3)),
                                      height: hei * 0.07,
                                      width: wid * 0.18,
                                      child: DropdownButton(
                                          value: dropdownvalue,
                                          iconEnabledColor: Colors.white,
                                          isExpanded: true,
                                          underline: Container(),
                                          dropdownColor: Colors.transparent
                                              .withOpacity(0.5),
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  items,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownvalue = newValue!;
                                            });
                                          }),
                                    ),
                                  ],
                                ),
                                SizedBox(height: hei * 0.03),
                                Visibility(
                                  visible: widget.round1,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Text("Image  :",
                                            style: GoogleFonts.poppins(
                                                fontSize: wid * 0.018,
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      SizedBox(width: wid * 0.07),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: GestureDetector(
                                          onTap: (() {
                                            imageSubmit
                                                ? pickFile("img")
                                                    .whenComplete(() {
                                                    if (url == null) {
                                                    } else {
                                                      setState(() {
                                                        imageSubmit = false;
                                                      });
                                                    }
                                                  })
                                                : Container();
                                          }),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                      width: 3)),
                                              height: hei * 0.07,
                                              width: wid * 0.18,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    imageSubmit
                                                        ? Icon(
                                                            Icons.image,
                                                            color: Colors.white,
                                                          )
                                                        : Container(),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: imageSubmit
                                                            ? Text(
                                                                "Upload Image ...",
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        wid *
                                                                            0.012,
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500))
                                                            : Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                      "Image Uploaded",
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize: wid *
                                                                              0.012,
                                                                          color: const Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              255,
                                                                              255),
                                                                          fontWeight:
                                                                              FontWeight.w500)),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            14.0),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          25,
                                                                      width: 50,
                                                                      child: MaterialButton(
                                                                          color: Colors.white,
                                                                          onPressed: () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  return AlertDialog(
                                                                                      content: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: <Widget>[
                                                                                      SizedBox(height: 300, width: 400, child: Image.memory(url!, fit: BoxFit.fill)),
                                                                                    ],
                                                                                  ));
                                                                                });
                                                                          },
                                                                          child: Text("View", style: GoogleFonts.poppins(fontSize: wid * 0.009, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500))),
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const VerticalDivider(
                                color: Colors.white, width: 5),
                            Column(
                              children: [
                                Text("Options",
                                    style: GoogleFonts.poppins(
                                        fontSize: wid * 0.018,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontWeight: FontWeight.w500)),
                                Textfield(
                                  wid: wid,
                                  context: context,
                                  width: 0.24,
                                  maxline: 1,
                                  label: 'Option A',
                                  controller: option1,
                                  validator: (value) {
                                    if (value.toString().trim() == 'A.' ||
                                        value.isEmpty) {
                                      return "Please Enter Option A";
                                    } else if (value.length <= 2) {
                                      return "must insert option value";
                                    } else if (value.length > 2) {
                                      if (value[1] != '.' || value[0] != 'A') {
                                        return "must insert option value";
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: hei * 0.015),
                                Textfield(
                                  wid: wid,
                                  context: context,
                                  controller: option2,
                                  width: 0.24,
                                  maxline: 1,
                                  label: 'Option B',
                                  validator: (value) {
                                    if (value.toString().trim() == 'B.' ||
                                        value.isEmpty) {
                                      return "Please Enter Option B";
                                    } else if (value.length <= 2) {
                                      return "must insert option value";
                                    } else if (value.length > 2) {
                                      if (value[1] != '.' || value[0] != 'B') {
                                        return "must insert option value";
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: hei * 0.015),
                                Textfield(
                                  wid: wid,
                                  context: context,
                                  width: 0.24,
                                  maxline: 1,
                                  label: 'Option C',
                                  controller: option3,
                                  validator: (value) {
                                    if (value.toString().trim() == "C." ||
                                        value.isEmpty) {
                                      return "Please Enter Option C";
                                    } else if (value.length <= 2) {
                                      return "must insert option value";
                                    } else if (value.length > 2) {
                                      if (value[1] != '.' || value[0] != 'C') {
                                        return "must insert option value";
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: hei * 0.015),
                                Textfield(
                                  context: context,
                                  wid: wid,
                                  width: 0.24,
                                  maxline: 1,
                                  label: 'Option D',
                                  controller: option4,
                                  validator: (value) {
                                    if (value.toString().trim() == 'D.' ||
                                        value.isEmpty) {
                                      return "Please Enter Option D";
                                    } else if (value.length <= 2) {
                                      return "must insert option value";
                                    } else if (value.length > 2) {
                                      if (value[1] != '.' || value[0] != 'D') {
                                        return "must insert option value";
                                      }
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: hei * 0.08),
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: hei * 0.07,
                            width: wid * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    width: 3)),
                            child: MaterialButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  } else {
                                    if (dropdownvalue1 == "select-question") {
                                      // ignore: void_checks
                                      showAlertDialog(context, "Info",
                                          "Question is Not Selected");
                                    } else {
                                      if (widget.round1 == true) {
                                        if (url == null) {
                                          showAlertDialog(context, "Info",
                                              "Image is Not Selected");
                                        } else {
                                          setState(() {
                                            finish = true;
                                          });

                                          uploadImage(url!,
                                                  dropdownvalue1.toString())
                                              .whenComplete(() {
                                            insert_qustion_r1(
                                                    dropdownvalue1 +
                                                        ". " +
                                                        question.text,
                                                    dropdownvalue1,
                                                    option1.text,
                                                    option2.text,
                                                    option3.text,
                                                    option4.text,
                                                    dropdownvalue,
                                                    img)
                                                .whenComplete(() {
                                              setState(() {
                                                finish = false;
                                              });
                                              if (responseCode == 200) {
                                                showAlertDialog(context, "Info",
                                                    "Question is Successfully Added !");
                                              } else {
                                                showAlertDialog(context, "Info",
                                                    "Question is Already Added !");
                                              }
                                            });

                                            clear_text();
                                          });
                                        }
                                      } else {
                                        insert_qustion_r3(
                                          dropdownvalue1 + ". " + question.text,
                                          dropdownvalue1,
                                          option1.text,
                                          option2.text,
                                          option3.text,
                                          option4.text,
                                          dropdownvalue,
                                        ).whenComplete(() {
                                          if (responseCode == 200) {
                                            showAlertDialog(context, "Info",
                                                "Question is Successfully Added !");
                                          } else {
                                            showAlertDialog(context, "Info",
                                                "Question is Already Added !");
                                          }
                                          clear_text();
                                        });
                                      }
                                    }
                                  }
                                },
                                child: Text(
                                  "Add",
                                  style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 14,
                                  ),
                                ),
                                color: Colors.pink),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ]),
        )),
        Visibility(visible: finish, child: loading(hei: hei, wid: wid)),
      ]),
    ));
  }

  void clear_text() {
    url = null;
    setState(() {
      imageSubmit = true;
    });
    question.clear();
    option1.text = "A. ";
    option2.text = "B. ";
    if (widget.round1 ? dropdownvalue1 != "30" : dropdownvalue1 != "20") {
      dropdownvalue1 = (int.parse(dropdownvalue1) + 1).toString();
    }
    option3.text = "C. ";
    option4.text = "D. ";
    dropdownvalue = "A";
  }
}
