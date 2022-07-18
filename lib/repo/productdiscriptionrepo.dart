import 'dart:convert';

import 'package:http/http.dart';
import 'package:vistox/Modal/productdiscriptionTap.dart';
import 'package:vistox/Modal/productdiscriptionmodal.dart';
import 'package:vistox/api/produtdiscriptionapi.dart';

class ProductDiscriptionRepo {
  ProductDiscriptionApi productDiscriptionApi = ProductDiscriptionApi();
  Future<ProductDiscriptionModal> fetchProductDiscription(id) async {
    final response = await productDiscriptionApi.fetchProductDiscription(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return ProductDiscriptionModal(jsonResponse);
  }

  Future<ProductDiscriptionTabModal> fetchProductDiscriptionTab(id) async {
    final response = await productDiscriptionApi.fetchProductDiscriptionTab(id);
    var jsonResponse = jsonDecode(response.body) as List;
    return ProductDiscriptionTabModal(jsonResponse);
  }
}
