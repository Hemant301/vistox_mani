import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        appBar: new PreferredSize(
            preferredSize: Size.fromHeight(130),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(1, 2), // changes position of shadow
                  )
                ],
              ),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      // color: Colors.grey,
                      height: 40,
                      width: MediaQuery.of(context).size.width - 30,
                      child: Row(children: [
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back, color: Colors.black)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ]),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeTab = 0;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: activeTab == 0
                                        ? Color.fromARGB(255, 18, 94, 226)
                                        : Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45.withOpacity(.1),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            1, 2), // changes position of shadow
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "Offers",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: activeTab == 0
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeTab = 1;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: activeTab == 1
                                        ? Color.fromARGB(255, 18, 94, 226)
                                        : Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45.withOpacity(.1),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            1, 2), // changes position of shadow
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "Socials",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: activeTab == 1
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeTab = 2;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: activeTab == 2
                                        ? Color.fromARGB(255, 18, 94, 226)
                                        : Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45.withOpacity(.1),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            1, 2), // changes position of shadow
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "Claim",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: activeTab == 2
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              )),
                        ])

                        //
                        ),
                  ],
                ),
              ),
            )),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: List.generate(
                      5,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    child: Text(
                                        "Earn upto Rs.1000 Off 😃 when purchasing more than one pair of nike jordans."),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    height:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/dummy/macdonal.png'),
                                            fit: BoxFit.fill),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    // child: Image.asset(
                                    //   "assets/dummy/macdonal.png",
                                    //   errorBuilder: (context, error, stackTrace) =>
                                    //       Image.asset('assets/b1.png'),
                                    //   fit: BoxFit.fill,
                                    // ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 5),
                                  child: Text(
                                    "12hrs ago",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          )),
                )
              ],
            )));
  }
}
