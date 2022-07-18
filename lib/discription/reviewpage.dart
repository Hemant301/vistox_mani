import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vistox/Modal/homemodal.dart';
import 'package:vistox/api/homeapi.dart';
import 'package:vistox/bloc/homebloc.dart';
import 'package:vistox/discription/productdiscription.dart';
import 'package:vistox/utils/user_cred.dart';
import '../utils/shared_function.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({Key? key, this.storeid}) : super(key: key);
  final String? storeid;
  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  String uploadedImg = "";
  bool showTextbox = false;
  double rate = 0.0;
  TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    homebloc.fetchRatingList("${widget.storeid}");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<RatingModal>(
          stream: homebloc.getRatingList.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Voice of Diner',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  snapshot.data!.rating!.rating.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                RatingBar.builder(
                    initialRating: snapshot.data!.rating!.rating,
                    minRating: 1,
                    itemSize: 40,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      // rate = rating;
                      // print(rate.runtimeType);
                      print(rating);
                    }),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Excellent',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Good',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Average',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Bad',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Poor',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 6,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width /
                                        2 *
                                        snapshot.data!.rating!.exc_rating! /
                                        100,
                                    height: 6,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 6,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 86, 148, 88),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width /
                                        2 *
                                        snapshot.data!.rating!.good_rating! /
                                        100,
                                    height: 6,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 6,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 104, 164, 106),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width /
                                        2 *
                                        snapshot.data!.rating!.avg_rating! /
                                        100,
                                    height: 6,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 6,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 231, 81, 31),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width /
                                        2 *
                                        snapshot.data!.rating!.bad_rating! /
                                        100,
                                    height: 6,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 6,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 240, 0, 0),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width /
                                        2 *
                                        snapshot.data!.rating!.poor_rating! /
                                        100,
                                    height: 6,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('149 Total Reviews')
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('4.6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Food')
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('4.6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Ambience')
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '4.6',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Service')
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('4.6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Hygine')
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Rate your Experience',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          itemSize: 40,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: false,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              showTextbox = true;
                            });
                            rate = rating;
                            // print(rate.runtimeType);
                            print(rating);
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      showTextbox == false
                          ? Container()
                          : Column(
                              children: [
                                TextFormField(
                                  maxLines: 4,
                                  controller: _commentController,
                                  // minLines: 4,
                                  decoration:
                                      InputDecoration(hintText: 'Add Comment'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () async {
                                    try {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();
                                      if (result != null) {
                                        File file =
                                            File(result.files.single.path!);
                                        print(file.path);
                                        showProgressDialog(context);
                                        HomeApi _api = HomeApi();
                                        Map data = await _api.doUploadProfile(
                                            file, userCred.getUserId());
                                        print(data);
                                        if (data['response'].toString() ==
                                            "1") {
                                          positiveToast(data['msg']);
                                          setState(() {
                                            uploadedImg = data['img'];
                                          });

                                          // homebloc.fetchuserDetails();
                                        } else {
                                          negetiveToast(data['msg']);
                                        }
                                        Navigator.pop(context);
                                      } else {
                                        negetiveToast("Something went wrong");
                                        // User canceled the picker
                                      }
                                    } catch (e) {
                                      negetiveToast(e.toString());
                                    }
                                  },
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          // shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1, color: Colors.blue)),
                                      child: Text(
                                        '+ Upload image',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    HomeApi _api = HomeApi();
                                    Map data = await _api.addComment(
                                        id: widget.storeid!,
                                        comment: _commentController.text,
                                        image: uploadedImg,
                                        rate: rate);

                                    if (data['response'].toString() == "1") {
                                      setState(() {
                                        showTextbox = false;
                                      });
                                      Fluttertoast.showToast(
                                          msg: 'Successfully Submitted');
                                    }
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Review',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.sort, color: Colors.grey[400]),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Sort',
                                  style: TextStyle(color: Colors.grey[400]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Wrap(
                  children: [
                    ReviewButtons(
                      name: 'All',
                      active: true,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ReviewButtons(
                      name: "Detailed review",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ReviewButtons(
                      name: "Verified visits",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ReviewButtons(name: "With photos"),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                    children: List.generate(
                  snapshot.data!.review.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReviewItem(
                      image: snapshot.data!.review[index].review_image,
                      profileimage: snapshot.data!.review[index].user_image,
                      name: snapshot.data!.review[index].user_name,
                      time: "3 min ago",
                      like: "5",
                      discription: snapshot.data!.review[index].comment,
                    ),
                  ),
                )),
                SizedBox(
                  height: 15,
                ),
              ],
            );
          }),
    );
  }
}

class ReviewItem extends StatelessWidget {
  ReviewItem(
      {Key? key,
      this.image,
      this.discription,
      this.like,
      this.name,
      this.profileimage,
      this.time})
      : super(key: key);

  String? profileimage;
  String? image;
  String? name;
  String? like;

  String? time;
  String? discription;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 7,
                  width: MediaQuery.of(context).size.width / 7,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image:
                          DecorationImage(image: NetworkImage(profileimage!))),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(Icons.verified, color: Colors.white),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Verified",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              discription!,
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Image.network(
          image!,
          errorBuilder: ((context, error, stackTrace) => Container()),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Icon(Icons.verified, color: Colors.black),
                // SizedBox(
                //   width: 3,
                // ),
                Text(
                  time!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.thumb_up, color: Colors.grey[700]),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Like (${like})",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.share, color: Colors.grey[700]),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Share",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.flag, color: Colors.grey[700]),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Flag",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
