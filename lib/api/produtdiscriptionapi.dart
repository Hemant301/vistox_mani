import 'package:http/http.dart' as http;
import 'package:vistox/utils/const.dart';

class ProductDiscriptionApi {
  Future<dynamic> fetchProductDiscription(id) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get_product_detail_vis.php"),
          body: {'store_id': '$id'});
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

  Future<dynamic> fetchProductDiscriptionTab(id) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${baseUrl}get-tabs-super-cat-vis.php"),
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
}
