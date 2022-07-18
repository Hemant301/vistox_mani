import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  const Offer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 60,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(115, 187, 179, 179)
                              .withOpacity(.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(1, 5), // changes position of shadow
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "15% off The Total Bill",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          "Save Extra 10% using promoCash",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Using VIstox Pay",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [
                                      0.1,
                                      0.4,
                                      0.6,
                                      0.9,
                                    ],
                                    colors: [
                                      Colors.yellow,
                                      Color.fromARGB(255, 234, 189, 84),
                                      Color.fromARGB(255, 216, 170, 18),
                                      Color.fromARGB(255, 255, 183, 0),
                                    ],
                                  )
                                  // border: Border.all(color: Color.fromARGB(255, 202, 195, 195)
                                  // ),
                                  ),
                              // width: MediaQuery.of(context).size.width / 5,
                              child: Column(
                                children: [
                                  Text(
                                    "Give Us a 5 Stare Feedback",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    "save Extra 10% using Promocash",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    )),
                Positioned(
                  top: -30,
                  right: 0,
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.withOpacity(0.4))),
                ),
                Positioned(
                  right: -30,
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.withOpacity(0.4))),
                )
              ],
            )),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "How it work?",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Bank offers",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 60,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(115, 187, 179, 179).withOpacity(.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(1, 5), // changes position of shadow
                      )
                    ],
                    color: Color.fromARGB(255, 4, 3, 73),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upto 15% off off with HDFC Bank\nCredit Card",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "with HDFC Bank Cradit Card",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),

                        // Text(
                        //   "Using VIstox Pay",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //       color: Colors.black,
                        //       // fontWeight: FontWeight.bold,
                        //       fontSize: 15),
                        // ),
                      ]))
            ]))
      ],
    );
  }
}
