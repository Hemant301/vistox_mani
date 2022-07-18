import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vistox/utils/const.dart';

class HomeApi {
  var client = http.Client();
  Future<dynamic> fetchHomeSlider(id) async {
    try {
      final response = await client.post(Uri.parse("${baseUrl}slider-vis.php"),
          body: {'super_app_id': id});
      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchHometabItems(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}home_sub_tab_content.php"),
          body: {'id': id});
      if (response.statusCode == 200) {
        //  print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchHomeTab() async {
    try {
      final response =
          await client.get(Uri.parse("${baseUrl}get-home-sub-tab-vis.php"));
      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchHomeCusine() async {
    try {
      final response =
          await client.get(Uri.parse("${baseUrl}get-food-cusine-vis.php"));
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> doUploadProfile(File file, String userid) async {
    var client = http.Client();
    try {
      var request = http.MultipartRequest(
          "POST", Uri.parse("${baseUrl}cdn/review-image-uploader.php"));
      //add text fields Uri.parse("http://192.168.29.30:8000/ajaxFile.php")
      request.fields["user_id"] = userid;
      //create multipart using filepath, string or bytes
      var pic = await http.MultipartFile.fromPath("thumbnail", file.path);
      //add multipart to request
      request.files.add(pic);
      var response = await request.send();

      //Get the response from the server
      var responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);
      print(responseString);
      return jsonDecode(responseString) as Map;
    } catch (e) {
      // print(e);
      rethrow;
    } finally {
      client.close();
    }
  }

  Future<dynamic> fetchmenutab(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get-subtab-vis.php"),
          body: {'super_tab_id': id});
      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchRatingList(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get-rating-vis.php"),
          body: {'store_id': id});
      if (response.statusCode == 200) {
        //  print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> getMenuid({
    String id = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get-subtab-vis.php"),
          body: {'super_tab_id': id});
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as List;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> addComment({
    String id = "",
    double rate = 0.0,
    String comment = "",
    String image = "",
  }) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("${baseUrl}save-rating-vis.php"), body: {
        'account_id': '1',
        'store_id': id,
        'rating': rate.toString(),
        'comment': comment,
        'review_image': image
      });
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      //  print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> fetchmenuImage(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get-subtab-option-vis.php"),
          body: {'tab_id': id});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchClosetoyou(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}super_app_home_section1.php"),
          body: {'super_app_id': id});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchOverview(id, storeid) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get-overview-section-content-vis.php"),
          body: {'super_app_id': id, 'store_id': storeid});
      if (response.statusCode == 200) {
        //  print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchFeature(id, storeid) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get-overview-feature-facility-vis.php"),
          body: {'super_app_id': id, 'store_id': storeid});
      if (response.statusCode == 200) {
        //  print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchStoredata(id, storeid) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get-store-detail-vis.php"),
          body: {'super_app_id': id, 'store_id': storeid});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchSection2(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}super_app_home_section2.php"),
          body: {'super_app_id': id});
      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchSection3(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}super_app_home_section3.php"),
          body: {'super_app_id': id});
      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchSection4(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}super_app_home_section4.php"),
          body: {'super_app_id': id});
      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchSupersubcat(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}super_app_home_sub_category_list.php"),
          body: {'super_app_id': id});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        // print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchHomeCategory() async {
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}get-super-app-vis.php"),
      );
      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchHomeNearby() async {
    try {
      final response = await client
          .post(Uri.parse("${baseUrl}get-super-app-vis.php"), body: {});
      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchSupercat(id) async {
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get-super-cat-vis.php"),
          body: {'super_app_id': id});
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }
}

final homeapi = HomeApi();
