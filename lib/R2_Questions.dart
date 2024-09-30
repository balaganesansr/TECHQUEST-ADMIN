import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_admin/api_call.dart';
import 'package:quiz_admin/constants.dart';
import 'package:quiz_admin/img_container.dart';
import 'package:quiz_admin/loading.dart';
import 'package:quiz_admin/textfield.dart';

class r2Question extends StatefulWidget {
  @override
  State<r2Question> createState() => _r2QuestionState();
}

class _r2QuestionState extends State<r2Question> {
  TextEditingController answer = TextEditingController();
  String dropdownvalue1 = 'select-question';
  String dropdownvalue = '4';
  bool finish = false;
  List<String> items = ["3", "4"];
  bool fourimg = true;

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
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Picture Round",
                              style: GoogleFonts.poppins(
                                  fontSize: width(context) * 0.02,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height(context) * 0.02),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text("Picture Count :",
                                  style: GoogleFonts.poppins(
                                      fontSize: width(context) * 0.015,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(height: height(context) * 0.02),
                            Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            width: 3)),
                                    height: height(context) * 0.07,
                                    width: width(context) * 0.21,
                                    child: DropdownButton(
                                      value: dropdownvalue,
                                      iconEnabledColor: Colors.white,
                                      isExpanded: true,
                                      underline: Container(),
                                      dropdownColor:
                                          Colors.transparent.withOpacity(0.5),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              items,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: ((value) {
                                        setState(() {
                                          dropdownvalue = value!;
                                          if (dropdownvalue == "3") {
                                            fourimg = false;
                                          } else {
                                            fourimg = true;
                                          }
                                        });
                                      }),
                                    ))),
                            SizedBox(height: height(context) * 0.03),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text("Question No.  :",
                                  style: GoogleFonts.poppins(
                                      fontSize: width(context) * 0.015,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(height: height(context) * 0.02),
                            Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            width: 3)),
                                    height: height(context) * 0.07,
                                    width: width(context) * 0.21,
                                    child: DropdownButton(
                                      value: dropdownvalue1,
                                      iconEnabledColor: Colors.white,
                                      isExpanded: true,
                                      underline: Container(),
                                      dropdownColor:
                                          Colors.transparent.withOpacity(0.5),
                                      items: items2.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              items,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: ((value) {
                                        setState(() {
                                          dropdownvalue1 = value!;
                                        });
                                      }),
                                    ))),
                            SizedBox(height: height(context) * 0.04),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text("Answer  :",
                                  style: GoogleFonts.poppins(
                                      fontSize: width(context) * 0.015,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontWeight: FontWeight.w500)),
                            ),
                            Textfield(
                              context: context,
                              wid: width(context),
                              width: 0.21,
                              maxline: 1,
                              label: 'Enter the Answer',
                              controller: answer,
                              validator: null,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 28.0, left: 180),
                              child: Container(
                                  height: height(context) * 0.07,
                                  width: width(context) * 0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          width: 3)),
                                  child: MaterialButton(
                                      onPressed: () {
                                        if (dropdownvalue1 ==
                                            "select-question") {
                                          showAlertDialog(context, "Info",
                                              "Please Select the Question");
                                        } else if (answer.text.trim() == "") {
                                          showAlertDialog(context, "Info",
                                              "Please Enter the Answer");
                                        } else if (dropdownvalue == "4" &&
                                            (url1 == null ||
                                                url2 == null ||
                                                url3 == null ||
                                                url4 == null)) {
                                          showAlertDialog(context, "Info",
                                              "Please Pick All Images");
                                        } else if (dropdownvalue == "3" &&
                                            (url1 == null ||
                                                url2 == null ||
                                                url3 == null)) {
                                          showAlertDialog(context, "Info",
                                              "Please Pick All Images");
                                        } else {
                                          setState(() {
                                            finish = true;
                                          });

                                          if (dropdownvalue == "4") {
                                            urls = [url1, url2, url3, url4];
                                          } else {
                                            urls = [url1, url2, url3];
                                          }

                                          addImage().whenComplete(() {
                                            insert_qustion_r2(dropdownvalue1,
                                                    answer.text, dropdownvalue)
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
                                              clear_text();
                                            });
                                          });
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
                                      color: Colors.pink)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width(context) * 0.02,
                        ),
                        const VerticalDivider(color: Colors.white),
                        SizedBox(
                          width: width(context) * 0.02,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (() {
                                    pickFile("img1").whenComplete(() {
                                      if (url1 == null) {
                                      } else {
                                        setState(() {
                                          img1 = true;
                                        });
                                      }
                                    });
                                  }),
                                  child: image_con(
                                    buttonText: "Upload Image 1",
                                    imagestatus: img1,
                                    image: url1,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (() {
                                    pickFile("img2").whenComplete(() {
                                      if (url2 == null) {
                                      } else {
                                        setState(() {
                                          img2 = true;
                                        });
                                      }
                                    });
                                  }),
                                  child: image_con(
                                    buttonText: "Upload Image 2",
                                    imagestatus: img2,
                                    image: url2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height(context) * 0.01,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (() {
                                    pickFile("img3").whenComplete(() {
                                      if (url3 == null) {
                                      } else {
                                        setState(() {
                                          img3 = true;
                                        });
                                      }
                                    });
                                  }),
                                  child: image_con(
                                    buttonText: "Upload Image 3",
                                    imagestatus: img3,
                                    image: url3,
                                  ),
                                ),
                                Visibility(
                                  visible: fourimg,
                                  child: GestureDetector(
                                    onTap: (() {
                                      pickFile("img4").whenComplete(() {
                                        if (url4 == null) {
                                        } else {
                                          setState(() {
                                            img4 = true;
                                          });
                                        }
                                      });
                                    }),
                                    child: image_con(
                                      buttonText: "Upload Image 4",
                                      imagestatus: img4,
                                      image: url4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]))
        ])),
        Visibility(
            visible: finish,
            child: loading(
              hei: height(context),
              wid: width(context),
            ))
      ]),
    ));
  }

  Future addImage() async {
    int i;
    for (i = 0; i < urls.length; i++) {
      await uploadImage(
          urls[i], dropdownvalue1.toString() + "_" + i.toString());
    }
  }

  void clear_text() {
    setState(() {
      img1 = false;
      img2 = false;
      img3 = false;
      img4 = false;
    });
    url1 = null;
    url2 = null;
    url3 = null;
    url4 = null;
    if (dropdownvalue1 != "20") {
      dropdownvalue1 = (int.parse(dropdownvalue1) + 1).toString();
    }
    answer.text = "";
  }
}
