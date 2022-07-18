import 'package:rxdart/rxdart.dart';
import 'package:vistox/utils/storage.dart';

class UserCred{
  bool isUserLogin(){
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive==''?false:true;
  }
  bool isHavePincode(){
    String isActive = StorageUtil.getString('PINCODE');
    //print("ff${isActive}ff");
    return isActive==''?false:true;
  }
  String getUserId(){
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive;
  }
  String getPincode(){
    String isActive = StorageUtil.getString('PINCODE');
    return isActive;
  }
  String getLng(){
    String isActive = StorageUtil.getString('LNG');
    return isActive;
  }String getLat(){
    String isActive = StorageUtil.getString('LAT');
    return isActive;
  }
  bool getPincodeAvail(){
    String isActive = StorageUtil.getString('AVAIL');
    return isActive=='true'?true:false;
  }
  void addUserId(String id){
    StorageUtil.putString('USERID', '$id');
  }
  void addPincode(String pin){
    StorageUtil.putString('PINCODE', '$pin');
  }
  void addPincodeAvail(bool isAvail){
    StorageUtil.putString('AVAIL', '$isAvail');
  }
  void addLatLng({double lat=0.0, double lng=0.0}){
    StorageUtil.putString('LAT', '$lat');
    StorageUtil.putString('LNG', '$lng');
  }
  void logoutUser(){
    StorageUtil.putString('USERID', '');
    StorageUtil.putString('PINCODE', '');
    StorageUtil.putString('LAT', '');
    StorageUtil.putString('LNG', '');
    StorageUtil.putString('AVAIL', 'false');
    StorageUtil.clearAll();
  }
}
final userCred = UserCred();