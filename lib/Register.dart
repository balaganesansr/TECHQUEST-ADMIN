import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:quiz_admin/drawer.dart';

class Regsiter extends StatefulWidget {
  const Regsiter({super.key});

  @override
  State<Regsiter> createState() => _Regsiter();
}

class _Regsiter extends State<Regsiter> with SingleTickerProviderStateMixin {
  TextEditingController teamname_input = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.black,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 50,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "MZCET TECHQUEST - 2023",
              style: TextStyle(
                  letterSpacing: 2, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 5,
            backgroundColor: Colors.indigo,
          ),
          body: AnimatedBackground(
            behaviour: RandomParticleBehaviour(options: particles),
            vsync: this,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 50),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: screenWidth / 2,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(97, 104, 103, 103)
                                    .withOpacity(0.3), //color of shadow
                                spreadRadius: 0, //spread radius
                                blurRadius: 12, // blur radius
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                                //first paramerter of offset is left-right
                                //second parameter is top to down
                              ),
                              //you can set more BoxShadow() here
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            controller: teamname_input,
                            onFieldSubmitted: ((value) {
                              if (value != null && value.isEmpty) {
                                return null;
                              } else {
                                if (value == "River@12345") {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => drawer())),
                                      (route) => false);
                                }
                              }
                            }),
                            style: const TextStyle(
                                color: Color.fromARGB(203, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                            cursorColor: const Color.fromARGB(203, 0, 0, 0),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                    Icons.supervised_user_circle_sharp,
                                    size: 33,
                                    color: Colors.indigo),
                                hintText: "Enter Admin Email",
                                hintStyle: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromARGB(159, 0, 0, 0)),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
