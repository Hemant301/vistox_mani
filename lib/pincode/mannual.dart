import 'package:flutter/material.dart';
import 'package:vistox/utils/user_cred.dart';

import 'oops.dart';


class MannualPage extends StatefulWidget {
  const MannualPage({Key? key}) : super(key: key);

  @override
  _MannualPageState createState() => _MannualPageState();
}

class _MannualPageState extends State<MannualPage> {
  TextEditingController? pinCon;
  @override
  void initState() {
    pinCon = TextEditingController();
    super.initState();
  }

  bool isinvalid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset(
                'assets/images/Aroundpin.gif',
                width: 300,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            "Sorry we couldn\'t fetch the pincode from your current location. Enter Manually instead.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                RoundedInputField(
                  controller: pinCon,
                  hintText: "Pincode",
                  icon: Icons.fmd_good,
                  onChanged: (value) {},
                ),
                isinvalid
                    ? Text(
                        "Invalid Pincode",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Colors.red),
                      )
                    : Container(),
                RoundedButton(
                  text: "Submit",
                  onpress: () async {
                    if (pinCon!.text == '') {
                      setState(() {
                        isinvalid = true;
                      });
                    } else {
                      setState(() {
                        isinvalid = false;
                      });
                      userCred.addPincode(pinCon!.text);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/navigationbar', ModalRoute.withName('/'));

                      // PincodeApi pincodeApi = new PincodeApi();
                      // final pincodes = await pincodeApi.getPincodes();
                      // int i = 0;
                      // for (i = 0; i < pincodes.length; i++) {
                      //   print('${pincodes[i]['pincode']}      ${pinCon?.text}');
                      //   if (pincodes[i]['pincode'] == pinCon?.text) {
                      //     //print("${pincodes[i]['pincode']}      ${ddd[2]} true");
                      //     userCred.addPincode(pinCon?.text ?? ' ');
                      //     userCred.addPincodeAvail(true);
                      //     Future.delayed(Duration(seconds: 0), () {
                      //       Navigator.of(context).pushNamedAndRemoveUntil(
                      //           '/main', ModalRoute.withName('/'));
                      //     });
                      //     break;
                      //   }
                    }
                    //   if (i == pincodes.length) {
                    //     //goto Mannual
                    //     print(false);
                    //     userCred.addPincodeAvail(false);
                    //     Future.delayed(Duration(seconds: 0), () {
                    //       Navigator.of(context).pushNamedAndRemoveUntil(
                    //           '/pincode/oops', ModalRoute.withName('/'));
                    //     });
                    //   }
                    // }
                    //Navigator.pushReplacementNamed(context, '/pincode/oops');
                  },
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const RoundedInputField(
      {Key? key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: Colors.black,
        cursorWidth: 1,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.amber,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget? child;
  const TextFieldContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.5),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
