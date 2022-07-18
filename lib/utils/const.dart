import 'package:geolocator/geolocator.dart';
import 'package:flutter_geocoder/geocoder.dart';

const baseUrl = "http://frontcyber.in/cms/ecom/vistox/api/app/next/";
Future<List<String>> getLocation(Position position) async {
  //Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //debugPrint('location: ${position.latitude}');
  final coordinates = new Coordinates(position.latitude, position.longitude);
  var addresses =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);
  var first = addresses.first;
  print("${first.featureName} : ${first.postalCode}");
  print('=======santosh======');
  print(position.latitude);
  print(position.longitude);

  return [
    first.addressLine ?? ' ',
    first.locality ?? ' ',
    first.postalCode ?? ' '
  ];
}
