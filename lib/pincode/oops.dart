import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OopsPage extends StatelessWidget {
  const OopsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Lottie.asset(
                'assets/18199-location-pin-on-a-map.json',
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              )),
        ),
        Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "It seems that we are currently unserviceable at your area. We\'re sorry for the inconvenience caused.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.black),
          ),
        ),
        Spacer(flex: 1),
        RoundedButton(
          text: "Re-Enter Pincode",
          onpress: () {
            Future.delayed(Duration(seconds: 0), () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/pincode/mannual', ModalRoute.withName('/'));
            });
          },
        ),
        Spacer(flex: 1),
      ]),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, this.onpress, this.text, this.color})
      : super(key: key);

  final String? text;
  final Function()? onpress;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
          // color:  Colors.accents,
          onPressed: onpress,
          child: Text(
            text!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
