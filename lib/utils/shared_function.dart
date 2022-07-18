import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart';

String getDateDDMMMYYYY(DateTime date) {
  final DateFormat formatter = DateFormat('dd MMM yyyy');
  final String formatted = formatter.format(date);
  return formatted;
}

positiveToast(String text) => Fluttertoast.showToast(
    msg: " $text! ",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0);
negetiveToast(String text) => Fluttertoast.showToast(
    msg: " $text! ",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);
dynamic showProgressDialog(context, [String label = "Please Wait!!!"]) =>
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.all(0),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Lottie.asset('assets/upload.json')),
              ));
          // Navigator.pop(context);
        });
