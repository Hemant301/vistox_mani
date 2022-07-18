import 'package:flutter/material.dart';
import 'package:vistox/Home/categoryslider.dart';
import 'package:vistox/Home/homeslider.dart';
import 'package:vistox/Modal/HomePageModal.dart';
import 'package:vistox/Modal/homemodal.dart';
import 'package:vistox/bloc/homebloc.dart';
import 'package:vistox/bloc/productdiscriptionbloc.dart';
import 'package:vistox/discription/productdiscription.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isactive = false;
  int activeTab = 0;
  switchWithInt() {
    switch (activeTab) {
      case 1:
        return Food();
      case 2:
        return Fitness();
      // case 3:
      //   return Wishlist();
      // case 4:
      //   return MyBeg();
      case 0:

      default:
        return All();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    homebloc.fetchSupercat(rcvdData['id']);
    homebloc.fetchHomeSlider(rcvdData['id']);
    homebloc.fetchClosetoyou(rcvdData['id']);
    homebloc.fetchSection2(rcvdData['id']);
    homebloc.fetchSection3(rcvdData['id']);
    homebloc.fetchSection4(rcvdData['id']);
    homebloc.fetchSupersubcat(rcvdData['id']);
    homebloc.fetchHomeCusine();

   

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: new PreferredSize(
          preferredSize: Size.fromHeight(100),
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(child: Image.asset("assets/logo.png")),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 202, 195, 195)),
                          ),
                          child: Row(children: const [
                            Text("Andheri East"),
                            Icon(Icons.arrow_drop_down)
                          ]),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/wallet 1.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("100"),
                              ]),
                        ),
                        // Icon(Icons.search),
                        Icon(Icons.notification_add)
                      ]),
                  Container(
                    // color: Colors.grey,
                    height: 40,
                    width: MediaQuery.of(context).size.width - 30,
                    child: Row(children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.search, color: Colors.grey[500]),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Text(
                          "Tap here to search for stores ,product,brands,etc",
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 10),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: StreamBuilder<SupercatModal>(
                          stream: homebloc.getSupercat.stream,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Container();
                            return GridView(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        // mainAxisSpacing: 5,
                                        // crossAxisSpacing: 5,
                                        childAspectRatio: 2.5 / 2.1),
                                shrinkWrap: true,
                                // crossAxisCount: 2,
                                // crossAxisSpacing: 1,
                                // mainAxisSpacing: 10,
                                physics: NeverScrollableScrollPhysics(),
                                children: List.generate(
                                  appCatData.length,
                                  (index) => InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/shop'
                                          
                                          );
                                    },
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                7,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                7,

                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(snapshot
                                                        .data!
                                                        .data[index]
                                                        .image!))),
                                            //  child: Image.asset(
                                            //     appCatData[index].image!,
                                            //     height: 40,
                                            //     width: 40,
                                            //     // col orBlendMode: BlendMode.colorBurn,
                                            //   ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            snapshot.data!.data[index].name!,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]),
                                  ),
                                ));
                          })),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.width / 2.5,
                      width: MediaQuery.of(context).size.width / 5.2,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/online_delivery 1.png"),
                          Container(
                            child: Text(
                              "Online\nDelivery",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<SliderModal>(
                  stream: homebloc.getHomeSlider.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return CategorySlider(
                      data: snapshot.data!.data,
                    );
                  }),
              // SizedBox(
              //   height: 10,
              // ),
              StreamBuilder<ClosetoYouModal>(
                  stream: homebloc.getClosetoyou.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data!.title!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    // letterSpacing: 1,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                )),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(
                                  snapshot.data!.store.length,
                                  (index) => InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/productdiscription",
                                              arguments: {
                                                'store_id': snapshot
                                                    .data!.store[index].storeid,
                                                'super_id': rcvdData['id']
                                              });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Stack(
                                                    // clipBehavior: Clip.none,
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4,
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            30,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                image:
                                                                    DecorationImage(
                                                                        image:
                                                                            NetworkImage(
                                                                          snapshot
                                                                              .data!
                                                                              .store[index]
                                                                              .storeimage!,
                                                                        ),
                                                                        fit: BoxFit
                                                                            .fill)),
                                                      ),
                                                      Positioned(
                                                        top: -30,
                                                        child: Transform.rotate(
                                                          angle: 19.7,
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                border: Border.all(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            238,
                                                                            255,
                                                                            200,
                                                                            0))),
                                                            height: 100,
                                                            width: 35,
                                                            child: Transform
                                                                .rotate(
                                                                    angle: 4.8,
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Text(
                                                                        "Save 30%",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
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
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      2),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .green,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 15,
                                                                  ),
                                                                  Text(
                                                                    "4.5",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ))),
                                                    ],
                                                  ),
                                                  Positioned(
                                                      bottom: -10,
                                                      right: 0,
                                                      left: 0,
                                                      child: Center(
                                                        child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black45
                                                                      .withOpacity(
                                                                          .2),
                                                                  spreadRadius:
                                                                      2,
                                                                  blurRadius: 2,
                                                                  offset: Offset(
                                                                      1,
                                                                      2), // changes position of shadow
                                                                )
                                                              ],
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                3.5,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Home ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Text(
                                                                  "Delivery",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          156,
                                                                          6,
                                                                          232)),
                                                                ),
                                                              ],
                                                            )),
                                                      ))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      30,
                                                  child: Text(
                                                    snapshot.data!.store[index]
                                                        .storename!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  )),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.pin_drop,
                                                      color: Colors.black,
                                                      size: 15,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: '8km',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  " ${snapshot.data!.store[index].cityname!}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))),
                        )
                      ],
                    );
                  }),
              StreamBuilder<ClosetoYouModal>(
                  stream: homebloc.getSection2.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data!.title!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    // letterSpacing: 1,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                )),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(
                                  snapshot.data!.store.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      30,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            snapshot
                                                                .data!
                                                                .store[index]
                                                                .storeimage!,
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
                                                              color: Color
                                                                  .fromARGB(
                                                                      238,
                                                                      255,
                                                                      200,
                                                                      0))),
                                                      height: 100,
                                                      width: 35,
                                                      child: Transform.rotate(
                                                          angle: 4.8,
                                                          child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "Save 30%",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.white,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                              "4.5",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        )))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    30,
                                                child: Text(
                                                  snapshot.data!.store[index]
                                                      .storename!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                )),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.pin_drop,
                                                    color: Colors.black,
                                                    size: 15,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: '8km',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text:
                                                                " ${snapshot.data!.store[index].cityname!}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ))),
                        )
                      ],
                    );
                  }),
              // SizedBox(
              //   height: 20,
              // ),
              // Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Text(
              //           "Trending Sports Near Your Hood",
              //           textAlign: TextAlign.start,
              //           style: TextStyle(
              //               color: Colors.black,
              //               // letterSpacing: 1,
              //               // fontWeight: FontWeight.bold,
              //               fontSize: 18),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 15,
              //       ),
              //       SingleChildScrollView(
              //           scrollDirection: Axis.horizontal,
              //           child: Row(
              //             children: List.generate(
              //               4,
              //               (index) => Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Container(
              //                         width:
              //                             MediaQuery.of(context).size.width / 4,
              //                         height:
              //                             MediaQuery.of(context).size.width / 4,
              //                         decoration: BoxDecoration(
              //                           shape: BoxShape.circle,
              //                           image: DecorationImage(
              //                               image: AssetImage(
              //                                   "assets/dummy/2.png"),
              //                               fit: BoxFit.fill),
              //                         )),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Center(
              //                       child: Container(
              //                           width:
              //                               MediaQuery.of(context).size.width /
              //                                   4,
              //                           child: Text(
              //                             "Football",
              //                             textAlign: TextAlign.center,
              //                             style: TextStyle(
              //                               fontSize: 15,
              //                               // fontWeight: FontWeight.bold,
              //                               color: Colors.black,
              //                             ),
              //                           )),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ))
              //     ]),
              SizedBox(
                height: 30,
              ),

              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Popular Cuisines",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                // letterSpacing: 1,
                                // fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StreamBuilder<HomeCusineModal>(
                        stream: homebloc.getHomeCusine.stream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Container();
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  snapshot.data!.data.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data!
                                                      .data[index]
                                                      .image!),
                                                  fit: BoxFit.fill),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                              child: Text(
                                                snapshot
                                                    .data!.data[index].name!,
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        }),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width / 6,
                                      height:
                                          MediaQuery.of(context).size.width / 6,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://media-cdn.tripadvisor.com/media/photo-s/10/d2/5d/6c/the-food-shop-harlow.jpg"),
                                            fit: BoxFit.fill),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Text(
                                          "Football",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                  ]),

              SizedBox(
                height: 20,
              ),
              StreamBuilder<ClosetoYouModal>(
                  stream: homebloc.getSection3.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data!.title!,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      // letterSpacing: 1,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  snapshot.data!.store.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3 +
                                                      20,
                                                  height: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3 -
                                                      10,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            snapshot
                                                                .data!
                                                                .store[index]
                                                                .storeimage!),
                                                        fit: BoxFit.fill),
                                                  )),
                                            ),
                                            Positioned(
                                                bottom: -8,
                                                right: 0,
                                                left: 0,
                                                child: Center(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors
                                                                .black45
                                                                .withOpacity(
                                                                    .2),
                                                            spreadRadius: 2,
                                                            blurRadius: 2,
                                                            offset: Offset(1,
                                                                2), // changes position of shadow
                                                          )
                                                        ],
                                                        color: Color.fromARGB(
                                                            255, 4, 42, 107),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.5,
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Grocery Stores",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      )),
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                        ]);
                  }),

              // Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Text(
              //           "Great Deals On Online Delivery",
              //           textAlign: TextAlign.start,
              //           style: TextStyle(
              //               color: Colors.black,
              //               // letterSpacing: 1,
              //               // fontWeight: FontWeight.bold,
              //               fontSize: 18),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 15,
              //       ),
              //       SingleChildScrollView(
              //           scrollDirection: Axis.horizontal,
              //           child: Row(
              //             children: List.generate(
              //               4,
              //               (index) => Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Stack(
              //                       clipBehavior: Clip.none,
              //                       children: [
              //                         Container(
              //                             width: MediaQuery.of(
              //                                             context)
              //                                         .size
              //                                         .width /
              //                                     3 +
              //                                 20,
              //                             height: MediaQuery.of(context)
              //                                         .size
              //                                         .width /
              //                                     2 +
              //                                 20,
              //                             decoration: BoxDecoration(
              //                               borderRadius:
              //                                   BorderRadius.circular(20),
              //                               image: DecorationImage(
              //                                   image: NetworkImage(
              //                                       "https://media-cdn.tripadvisor.com/media/photo-s/10/d2/5d/6c/the-food-shop-harlow.jpg"),
              //                                   fit: BoxFit.fill),
              //                             )),
              //                         Positioned(
              //                             bottom: -15,
              //                             right: 0,
              //                             left: 0,
              //                             child: Center(
              //                               child: Container(
              //                                   decoration: BoxDecoration(
              //                                     boxShadow: [
              //                                       BoxShadow(
              //                                         color: Colors.black45
              //                                             .withOpacity(.2),
              //                                         spreadRadius: 2,
              //                                         blurRadius: 2,
              //                                         offset: Offset(1,
              //                                             2), // changes position of shadow
              //                                       )
              //                                     ],
              //                                     color: Colors.white,
              //                                     borderRadius:
              //                                         BorderRadius.circular(8),
              //                                   ),
              //                                   width: MediaQuery.of(context)
              //                                           .size
              //                                           .width /
              //                                       3.5,
              //                                   padding: EdgeInsets.all(5),
              //                                   child: Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       Text("Home "),
              //                                       Text(
              //                                         "Delivery",
              //                                         style: TextStyle(
              //                                             color: Color.fromARGB(
              //                                                 255,
              //                                                 156,
              //                                                 6,
              //                                                 232)),
              //                                       ),
              //                                     ],
              //                                   )),
              //                             ))
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: 20,
              //                     ),
              //                     Container(
              //                         width: MediaQuery.of(context).size.width /
              //                                 2 -
              //                             30,
              //                         child: Text(
              //                           "Nike Andheri Sports Superstore",
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.bold,
              //                               fontSize: 15),
              //                         )),
              //                     SizedBox(
              //                       height: 3,
              //                     ),
              //                     Container(
              //                         width: MediaQuery.of(context).size.width /
              //                                 3 +
              //                             20,
              //                         child: Text(
              //                           "Delivers in 3 hrs",
              //                           style: TextStyle(
              //                             color: Colors.grey,
              //                           ),
              //                         )),
              //                     SizedBox(
              //                       height: 3,
              //                     ),
              //                     Row(
              //                       children: [
              //                         Text(
              //                           "₹2589",
              //                           style: TextStyle(
              //                               color: Colors.grey,
              //                               decoration:
              //                                   TextDecoration.lineThrough),
              //                         ),
              //                         Text(
              //                           " ₹1586",
              //                           style: TextStyle(
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.bold),
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ))
              //     ]),
              SizedBox(
                height: 20,
              ),

              //
              SizedBox(
                height: 20,
              ),
              StreamBuilder<ClosetoYouModal>(
                  stream: homebloc.getSection4.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data!.title!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    // letterSpacing: 1,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                )),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(
                                  snapshot.data!.store.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      30,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            snapshot
                                                                .data!
                                                                .store[index]
                                                                .storeimage!,
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
                                                              color: Color
                                                                  .fromARGB(
                                                                      238,
                                                                      255,
                                                                      200,
                                                                      0))),
                                                      height: 100,
                                                      width: 35,
                                                      child: Transform.rotate(
                                                          angle: 4.8,
                                                          child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "Save 30%",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.white,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                              "4.5",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        )))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    30,
                                                child: Text(
                                                  snapshot.data!.store[index]
                                                      .storename!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                )),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.pin_drop,
                                                    color: Colors.black,
                                                    size: 15,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: '8km',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text:
                                                                " ${snapshot.data!.store[index].cityname!}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ))),
                        )
                      ],
                    );
                  }),
              SizedBox(
                height: 50,
              ),
              StreamBuilder<SupercatModal>(
                  stream: homebloc.getSupercat.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                          snapshot.data!.data.length,
                          (index) => Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeTab = int.parse(
                                        snapshot.data!.data[index].id!);
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: activeTab ==
                                            int.parse(
                                                snapshot.data!.data[index].id!)
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
                                    snapshot.data!.data[index].name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: activeTab == 0
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              )),
                        ))

                        //
                        );
                  }),

              switchWithInt()
            ]),
      ),
    );
  }
}

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          5,
          (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width / 3 - 10,
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/dummy/macdonal.png",
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
                                      color: Color.fromARGB(238, 255, 200, 0))),
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
                                          fontWeight: FontWeight.bold,
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
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )))
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: Text(
                              "Nike Andheri Sports Superstore",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Row(
                            children: [
                              Icon(
                                Icons.pin_drop,
                                color: Colors.black,
                                size: 15,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '8km',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: ' sector 3',
                                        style:
                                            TextStyle(color: Colors.black54)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 2.5,
                          color: Colors.grey,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Text(
                              "Quick Bites, 400 for two",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            )),
                        Container(
                            // padding: EdgeInsets.symmetric(vertical: 3),
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Text(
                              "2504 bought, last redeemed yesterday",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Food")],
    );
  }
}

class Fitness extends StatelessWidget {
  const Fitness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Fitness")],
    );
  }
}
