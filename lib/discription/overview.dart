import 'package:flutter/material.dart';
import 'package:vistox/Modal/homemodal.dart';
import 'package:vistox/bloc/homebloc.dart';

class OverviewPage extends StatelessWidget {
  OverviewPage({Key? key, required this.storeid, required this.superappid})
      : super(key: key);
  final String storeid;
  final String superappid;
  int id = 5;
  @override
  Widget build(BuildContext context) {
    homebloc.fetchOverview(superappid, storeid);
    homebloc.fetchFeature(superappid, storeid);
    // ProductDiscriptionBlocss.fetchproductDiscription(id);
    return Column(
      children: [
        StreamBuilder<StoreModal>(
            stream: homebloc.getStaoredata.stream,
            builder: (context, newsnapshot) {
              if (!newsnapshot.hasData) return Container();
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 60,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45.withOpacity(.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(1, 2), // changes position of shadow
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsnapshot.data!.store_name!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Text(
                          newsnapshot.data!.store_description!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey[400],
                              // fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                        Row(
                          children: [
                            Text(
                              newsnapshot.data!.avg_price!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Text(
                              newsnapshot.data!.key_feature!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Now Open .",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.green,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Text(
                              " Closes at ${newsnapshot.data!.close_time}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Upto 15% off with HDFC Bank Credit Cards",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey[400],
                                // fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: 60,
            // padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45.withOpacity(.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 2), // changes position of shadow
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/makup.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pay Bill",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        "Save Extra 10% using promoCash",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[400],
                            // fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 18, 94, 226),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45.withOpacity(.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(1, 2), // changes position of shadow
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "15%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Flat Off",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: 60,
            // padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45.withOpacity(.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 2), // changes position of shadow
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/makup.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reserve a Table",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: 60,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45.withOpacity(.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 2), // changes position of shadow
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stories",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "Capture memories and be the first one to upload a story here.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.grey[400],
                                // fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ADD  STORY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 18, 94, 226),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/makup.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: 60,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45.withOpacity(.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 2), // changes position of shadow
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Text(
                      "This restaurant has the best Lorem Ipsum which is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. read less",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey[400],
                          // fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   "ADD  STORY",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 18, 94, 226),
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 12),
                  // ),
                  StreamBuilder<OverViewModal>(
                      stream: homebloc.getOverview.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return Container();
                        return Column(
                          children: List.generate(
                            snapshot.data!.overview.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/makup.png",
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.overview[index].title!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          snapshot.data!.overview[index].desc!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      }),
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/makup.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            StreamBuilder<FeatureModal>(
                                stream: homebloc.getfeatures.stream,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) return Container();
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'FEATURES & FACILITIES',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: GridView.count(
                                          shrinkWrap: true,
                                          crossAxisCount: 2,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          childAspectRatio: 2 / 0.6,
                                          children: List.generate(
                                              snapshot.data!.overview.length,
                                              (index) => Text(snapshot.data!
                                                  .overview[index].title!)),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ]),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: 60,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45.withOpacity(.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(1, 2), // changes position of shadow
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CUISINE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Text(
                              "Mexican, American",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/makup.png",
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ]),
                ),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You May Also Like",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    // letterSpacing: 1,
                    // fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      4,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.width / 4,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                "https://thumbs.dreamstime.com/b/convenience-store-interior-variety-good-shelves-display-57214846.jpg",
                                              ),
                                              fit: BoxFit.fill)),
                                    ),
                                    Positioned(
                                      top: -30,
                                      child: Transform.rotate(
                                        angle: 19.7,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      238, 255, 200, 0))),
                                          height: 100,
                                          width: 35,
                                          child: Transform.rotate(
                                              angle: 4.8,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Save 30%",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 7),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "4.5",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )))
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            30,
                                    child: Text(
                                      'MDTC',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "Ranchi",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ))
                              ],
                            ),
                          ))),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: 60,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45.withOpacity(.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(1, 2), // changes position of shadow
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Messing some information",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SHARE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ]),
                ),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
    );
  }
}
