import 'package:flutter/material.dart';
import 'package:vistox/Modal/HomePageModal.dart';
import 'package:vistox/Modal/homemodal.dart';
import 'package:vistox/Modal/productdiscriptionTap.dart';
import 'package:vistox/Modal/productdiscriptionmodal.dart';
import 'package:vistox/bloc/homebloc.dart';
import 'package:vistox/bloc/productdiscriptionbloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vistox/discription/menu.dart';
import 'package:vistox/discription/reviewpage.dart';

class ProductDiscription extends StatefulWidget {
  const ProductDiscription({Key? key}) : super(key: key);

  @override
  State<ProductDiscription> createState() => _ProductDiscriptionState();
}

class _ProductDiscriptionState extends State<ProductDiscription> {
  int pageIndex = 0;
  int alltab = 0;
  String idofoffer = "1";
  int id = 5;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    ProductDiscriptionBlocss.fetchProductDiscriptionTab(rcvdData['super_id']);
    homebloc.fetchStoredata(rcvdData['super_id'], rcvdData['store_id']);
  }

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['super_id']);
    print('store id${rcvdData['store_id']}');
    // ProductDiscriptionBlocss.fetchProductDiscriptionTab(rcvdData['super_id']);
    // homebloc.fetchStoredata(rcvdData['super_id'], rcvdData['store_id']);
    // switchWithInt() {
    //   switch (activeTab) {
    //     case 1:
    //       return Offer();
    //     // case 2:
    //     //   return Profile();
    //     // case 3:
    //     //   return Wishlist();
    //     // case 4:
    //     //   return MyBeg();
    //     case 0:

    //     default:
    //       return Overview();
    //   }
    // }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder<StoreModal>(
            stream: homebloc.getStaoredata.stream,
            builder: (context, newsnapshot) {
              if (!newsnapshot.hasData) return Container();
              return Column(children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child:
                          // Image.asset(
                          //   "assets/dummy/macdonal.png",
                          //   errorBuilder: (context, error, stackTrace) =>
                          //       Image.asset('assets/b1.png'),
                          //   fit: BoxFit.fill,
                          // ),

                          PageView(
                        onPageChanged: (i) {
                          print(i);
                          setState(() {
                            pageIndex = i;
                          });
                        },
                        children: List.generate(
                          newsnapshot.data!.store_image.length,
                          (index) => InkWell(
                            child: Container(
                              // height: 100,
                              // width: 100,
                              child: Image.network(
                                newsnapshot.data!.store_image[index].img!,
                                fit: BoxFit.fill,

                                // fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.share_sharp,
                                        color: Colors.white,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            height: 60,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: StreamBuilder<
                                        ProductDiscriptionTabModal>(
                                    stream: ProductDiscriptionBlocss
                                        .getproductDiscriptionTab.stream,
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) return Container();
                                      return Row(
                                          children: List.generate(
                                        snapshot.data!.tab.length,
                                        (index) => Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: InkWell(
                                              onTap: () {
                                                idofoffer = snapshot
                                                    .data!.tab[index].id!;
                                                print(idofoffer);
                                                setState(() {
                                                  alltab = index;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Text(
                                                    snapshot
                                                        .data!.tab[index].name!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: alltab == index
                                                            ? Colors.blue
                                                            : Colors.black),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      height: 4,
                                                      color: alltab == index
                                                          ? Colors.blue
                                                          : Colors.white)
                                                ],
                                              ),
                                            )),
                                      ));
                                    })),
                          ),
                        ))
                  ],
                ),
                idofoffer == "1"
                    ? Overview(
                        storeid: rcvdData['store_id'],
                        superappid: rcvdData['super_id'],
                      )
                    : Container(),
                idofoffer == "2" ? MenuPage() : Container(),
                idofoffer == "3" ? Offer() : Container(),
                idofoffer == "4" ? ReviewSection(
                   storeid: rcvdData['store_id'],
                ) : Container(),
              ]);
            }),
      ),
    );
  }
}

// class ReviewSection extends StatefulWidget {
//   const ReviewSection({Key? key}) : super(key: key);

//   @override
//   State<ReviewSection> createState() => _ReviewSectionState();
// }

// class _ReviewSectionState extends State<ReviewSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Text(
//               'Voice of Diner',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             '4.1',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           RatingBar.builder(
//               initialRating: 4,
//               minRating: 1,
//               itemSize: 40,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               ignoreGestures: true,
//               itemCount: 5,
//               itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
//               itemBuilder: (context, _) => const Icon(
//                     Icons.star,
//                     color: Colors.amber,
//                   ),
//               onRatingUpdate: (rating) {
//                 // rate = rating;
//                 // print(rate.runtimeType);
//                 print(rating);
//               }),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Excellent',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'Good',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'Average',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'Bad',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'Poor',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width / 2,
//                               height: 6,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.green,
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width /
//                                   2 *
//                                   70 /
//                                   100,
//                               height: 6,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width / 2,
//                               height: 6,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 86, 148, 88),
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width /
//                                   2 *
//                                   40 /
//                                   100,
//                               height: 6,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width / 2,
//                               height: 6,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 104, 164, 106),
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width /
//                                   2 *
//                                   30 /
//                                   100,
//                               height: 6,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width / 2,
//                               height: 6,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 231, 81, 31),
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width /
//                                   2 *
//                                   20 /
//                                   100,
//                               height: 6,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width / 2,
//                               height: 6,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 240, 0, 0),
//                                   borderRadius: BorderRadius.circular(10)),
//                               width: MediaQuery.of(context).size.width /
//                                   2 *
//                                   10 /
//                                   100,
//                               height: 6,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.star,
//                       color: Colors.amber,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text('149 Total Reviews')
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       color: Colors.grey.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         children: [
//                           CircleAvatar(
//                             radius: 35,
//                             backgroundColor: Colors.blue,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('4.6',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           Text('Food')
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           CircleAvatar(
//                             radius: 35,
//                             backgroundColor: Colors.blue,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('4.6',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           Text('Ambience')
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           CircleAvatar(
//                             radius: 35,
//                             backgroundColor: Colors.blue,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             '4.6',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text('Service')
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           CircleAvatar(
//                             radius: 35,
//                             backgroundColor: Colors.blue,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('4.6',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           Text('Hygine')
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'Rate your Experience',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 RatingBar.builder(
//                     initialRating: 0,
//                     minRating: 1,
//                     itemSize: 40,
//                     direction: Axis.horizontal,
//                     allowHalfRating: true,
//                     ignoreGestures: false,
//                     itemCount: 5,
//                     itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
//                     itemBuilder: (context, _) => const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                     onRatingUpdate: (rating) {
//                       // rate = rating;
//                       // print(rate.runtimeType);
//                       print(rating);
//                     }),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Review',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Icon(Icons.sort, color: Colors.grey[400]),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             'Sort',
//                             style: TextStyle(color: Colors.grey[400]),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//           Wrap(
//             children: [
//               ReviewButtons(
//                 name: 'All',
//                 active: true,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               ReviewButtons(
//                 name: "Detailed review",
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               ReviewButtons(
//                 name: "Verified visits",
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               ReviewButtons(name: "With photos"),
//               SizedBox(
//                 width: 10,
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class ReviewButtons extends StatelessWidget {
  ReviewButtons({Key? key, this.name = "", this.active = false})
      : super(key: key);
  final String name;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: active == true ? Colors.deepPurple : Colors.grey[100]),
        child: Text(
          '$name',
          style: TextStyle(
              color: active == true ? Colors.white : Colors.black,
              fontSize: 14),
        ),
      ),
    );
  }
}

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

class Overview extends StatelessWidget {
  Overview({Key? key, required this.storeid, required this.superappid})
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
                            newsnapshot.data!.is_open == 1
                                ? Text(
                                    "Now Open .",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                : Text(
                                    "Closed Now .",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red,
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
                          height: 10,
                        ),
                        // Center(
                        //   child: Text(
                        //     "Upto 15% off with HDFC Bank Credit Cards",
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: Colors.grey[400],
                        //         // fontWeight: FontWeight.bold,
                        //         fontSize: 10),
                        //   ),
                        // ),
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
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     // height: 60,
        //     padding: const EdgeInsets.all(10.0),
        //     decoration: BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black45.withOpacity(.1),
        //           spreadRadius: 2,
        //           blurRadius: 2,
        //           offset: Offset(1, 2), // changes position of shadow
        //         )
        //       ],
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   "Stories",
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       color: Colors.black,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12),
        //                 ),
        //                 Container(
        //                   width: MediaQuery.of(context).size.width / 2,
        //                   child: Text(
        //                     "Capture memories and be the first one to upload a story here.",
        //                     textAlign: TextAlign.start,
        //                     style: TextStyle(
        //                         color: Colors.grey[400],
        //                         // fontWeight: FontWeight.bold,
        //                         fontSize: 10),
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text(
        //                   "ADD  STORY",
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       color: Color.fromARGB(255, 18, 94, 226),
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Image.asset(
        //               "assets/makup.png",
        //               height: 40,
        //               width: 40,
        //             ),
        //           ),
        //         ]),
        //   ),
        // ),
        StreamBuilder<StoreModal>(
            stream: homebloc.getStaoredata.stream,
            builder: (context, newsnapshot) {
              if (!newsnapshot.hasData) return Container();
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
                            newsnapshot.data!.short_description!,
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                                snapshot.data!.overview[index]
                                                    .title!,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                snapshot.data!.overview[index]
                                                    .desc!,
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
                                        if (!snapshot.hasData)
                                          return Container();
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: GridView.count(
                                                shrinkWrap: true,
                                                crossAxisCount: 2,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                childAspectRatio: 2 / 0.6,
                                                children: List.generate(
                                                    snapshot
                                                        .data!.overview.length,
                                                    (index) => Text(snapshot
                                                        .data!
                                                        .overview[index]
                                                        .title!)),
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
              );
            }),
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
