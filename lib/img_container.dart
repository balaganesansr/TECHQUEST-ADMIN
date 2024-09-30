import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_admin/constants.dart';

class image_con extends StatefulWidget {
  final buttonText, image;
  final bool? imagestatus;
  image_con({Key? key, this.buttonText, this.image, this.imagestatus})
      : super(key: key);

  @override
  State<image_con> createState() => _image_conState();
}

class _image_conState extends State<image_con> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          width: width(context) * 0.23,
          height: height(context) * 0.34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 5, color: Colors.white)),
          child: widget.imagestatus!
              ? Image.memory(
                  widget.image,
                  fit: BoxFit.fill,
                )
              : SizedBox(
                  width: 180,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.image,
                            size: 60,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Text(widget.buttonText,
                            style: GoogleFonts.openSans(
                                color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                )),
    );
  }
}
