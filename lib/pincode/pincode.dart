import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:location/location.dart';
import 'package:lottie/lottie.dart';
import 'package:vistox/utils/const.dart';
import 'package:vistox/utils/user_cred.dart';

class PincodePage extends StatefulWidget {
  const PincodePage({Key? key}) : super(key: key);

  @override
  _PincodePageState createState() => _PincodePageState();
}

class _PincodePageState extends State<PincodePage> {
  String lat = ' ';
  String lng = ' ';
  Location location = new Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  bool isfetching = true;
  String pincode = '------';
  @override
  void initState() {
    getAccurateLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Lottie.asset(
                'assets/64178-location-pin.json',
                width: 300,
                //fit: BoxFit.fill,
              )),
        ),
        Spacer(flex: 2),
        isfetching
            ? Text(
                "$pincode",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 24,
                    letterSpacing: 18,
                    color: Colors.amber),
              )
            : Container(),
        Spacer(flex: 1),
        isfetching
            ? Text(
                pin_fetching_text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black),
              )
            : Column(
                children: [
                  Text(
                    pin_unable_text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: 250,
                    child: RoundedButton(
                      text: "Back To Home",
                      onpress: () {
                        Navigator.pushReplacementNamed(
                            context, '/navigationbar');
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: 250,
                    child: RoundedButton(
                      text: "Mannually Enter",
                      onpress: () {
                        Navigator.pushReplacementNamed(context, '/mannual');
                      },
                    ),
                  ),
                ],
              ),
        Spacer(flex: 1),
      ]),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      setState(() {
        isfetching = false;
      });
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        setState(() {
          isfetching = true;
        });
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      setState(() {
        isfetching = false;
      });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void getAccurateLocation() async {
    print("-----------------Satrt Location-------------------");
    try {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          setState(() {
            isfetching = false;
          });
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          setState(() {
            isfetching = false;
          });
          return;
        }
      }
      print("----------------- End Location-------------------");
      Position position = await _determinePosition();
      print("-----------------2nd end Location-------------------");
      List<String> ddd = await getLocation(position);
      // PincodeApi pincodeApi = new PincodeApi();
      setState(() {
        pincode = ddd[2];
      });
      userCred.addPincode(ddd[2]);
      print('==================================');
      print(userCred.getPincode());
      if (pincode.length > 0) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/navigationbar', ModalRoute.withName('/'));
        });
      } else {}

      // final pincodes = await pincodeApi.getPincodes();
      //print(pincodes);
      // int i = 0;
      // for (i = 0; i < pincodes.length; i++) {
      //   //print('${pincodes[i]['pincode']}      ${ddd[2]}');
      //   if (pincodes[i]['pincode'] == ddd[2]) {
      //     //print("${pincodes[i]['pincode']}      ${ddd[2]} true");
      //     userCred.addPincode(ddd[2]);
      //     userCred.addPincodeAvail(true);
      //     userCred.addLatLng(lat: position.latitude, lng: position.longitude);
      //     Future.delayed(Duration(seconds: 0), () {
      //       Navigator.of(context)
      //           .pushNamedAndRemoveUntil('/main', ModalRoute.withName('/'));
      //     });
      //     break;
      //   }
      // }
      // if (i == pincodes.length) {
      //   //goto Mannual
      //   //print(false);
      //   Future.delayed(Duration(seconds: 0), () {
      //     Navigator.pushReplacementNamed(context, '/mannual');
      //   });
      // }
    } catch (e) {
      setState(() {
        isfetching = false;
      });
    }
    //_getLocation(position);
    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     setState(() {
    //       isfetching=true;
    //     });
    //     return;
    //   }
    // }

    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     setState(() {
    //       isfetching=true;
    //     });
    //     return;
    //   }
    // }
    // _locationData = await location.getLocation();
    // print(_locationData!.longitude);
    // lng="${_locationData?.longitude??0.0}";
    // lat="${_locationData?.latitude??0.0}";
    //List<String> ddd = await getAddressFromLocation(_locationData!.longitude??0.0, _locationData!.longitude??0.0);
    // print(ddd);
    // setState(() {
    //   pincode=ddd[2];
    // });
  }
}

const String pin_fetching_text = "Fetching your pincode...";
const String pin_unable_text = "Please enter mannually";

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
          color: Colors.amber,
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
