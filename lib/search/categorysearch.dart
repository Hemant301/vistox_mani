import 'package:flutter/material.dart';
import 'package:vistox/Modal/productdiscriptionTap.dart';
import 'package:vistox/bloc/homebloc.dart';

class CategorySearchPage extends StatefulWidget {
  const CategorySearchPage({Key? key}) : super(key: key);

  @override
  State<CategorySearchPage> createState() => _CategorySearchPageState();
}

class _CategorySearchPageState extends State<CategorySearchPage> {
  @override
  Widget build(BuildContext context) {
    homebloc.fetchSearch("c");
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<SearchModal>(
            stream: homebloc.getSearch.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              return SingleChildScrollView(
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45.withOpacity(.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(1, 2), // changes position of shadow
                        )
                      ],
                    ),
                    height: 80,
                    //         child: Row(children: [
                    //         TextField (
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     labelText: 'Enter Name',
                    //     hintText: 'Enter Your Name'
                    //   ),
                    // )
                    // ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: List.generate(
                        snapshot.data!.store.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45.withOpacity(.1),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            1, 2), // changes position of shadow
                                      )
                                    ],
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    snapshot.data!.store[index]
                                                        .store_name!,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
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
                                                            color: Colors.white,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .store[index]
                                                                .rating!,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "(500+)",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    ".",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(Icons.timelapse,
                                                      color: Colors.grey,
                                                      size: 15),
                                                  Text(
                                                    " 45 Min  ",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Icon(Icons.location_city,
                                                      color: Colors.grey,
                                                      size: 10),
                                                  Text(
                                                    snapshot.data!.store[index]
                                                        .distance
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "American, Fast Food",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    50,
                                                child: Text(
                                                  "Upto 15% off upto 100 Get Cashback on order above 500 ",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              children: List.generate(
                                                  snapshot.data!.store[index]
                                                      .fooditems.length,
                                                  (i) => InkWell(
                                                        onTap: () {
                                                          // Navigator.pushNamed(
                                                          //     context, "/productdiscription",
                                                          //     arguments: {
                                                          //       'store_id': snapshot
                                                          //           .data!.store[index].storeid,
                                                          //       'super_id': rcvdData['id']
                                                          //     });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Stack(
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  Stack(
                                                                    // clipBehavior: Clip.none,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              "/shopmenu");
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.width / 4,
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 2 - 30,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              image: DecorationImage(
                                                                                  image: NetworkImage(
                                                                                    snapshot.data!.store[index].fooditems[i].item_image!,
                                                                                  ),
                                                                                  fit: BoxFit.fill)),
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        top:
                                                                            -30,
                                                                        child: Transform
                                                                            .rotate(
                                                                          angle:
                                                                              19.7,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.red, border: Border.all(color: Color.fromARGB(238, 255, 200, 0))),
                                                                            height:
                                                                                100,
                                                                            width:
                                                                                35,
                                                                            child: Transform.rotate(
                                                                                angle: 4.8,
                                                                                child: Align(
                                                                                  alignment: Alignment.center,
                                                                                  child: Text(
                                                                                    "Save 30%",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 7),
                                                                                  ),
                                                                                )),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                          top:
                                                                              7,
                                                                          right:
                                                                              10,
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite,
                                                                            color:
                                                                                Colors.white,
                                                                          )),
                                                                      Positioned(
                                                                          top:
                                                                              10,
                                                                          right:
                                                                              40,
                                                                          child: Container(
                                                                              padding: EdgeInsets.all(2),
                                                                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(5)),
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
                                                                                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                ],
                                                                              ))),
                                                                    ],
                                                                  ),
                                                                  Positioned(
                                                                      bottom:
                                                                          -10,
                                                                      right: 0,
                                                                      left: 0,
                                                                      child:
                                                                          Center(
                                                                        child: Container(
                                                                            decoration: BoxDecoration(
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.black45.withOpacity(.2),
                                                                                  spreadRadius: 2,
                                                                                  blurRadius: 2,
                                                                                  offset: Offset(1, 2), // changes position of shadow
                                                                                )
                                                                              ],
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            width: MediaQuery.of(context).size.width / 3.5,
                                                                            padding: EdgeInsets.all(5),
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  "Home ",
                                                                                  style: TextStyle(fontSize: 10),
                                                                                ),
                                                                                Text(
                                                                                  "Delivery",
                                                                                  style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 156, 6, 232)),
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
                                                                    snapshot
                                                                        .data!
                                                                        .store[
                                                                            index]
                                                                        .fooditems[
                                                                            i]
                                                                        .item_name!,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            12),
                                                                  )),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    3,
                                                                child: RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    text:
                                                                        'Rs ${snapshot.data!.store[index].fooditems[i].item_price!}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                height: 25,
                                                                // padding: EdgeInsets.all(8),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        text:
                                                                            '  ADD',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      //  padding: EdgeInsets.all(4),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            68,
                                                                            13,
                                                                            221),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4),
                                                                      ),
                                                                      child: Center(
                                                                          child: Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ))),
                                        )
                                      ]),
                                ),
                              ),
                            )),
                  )
                ]),
              );
            }),
      ),
    );
  }
}
