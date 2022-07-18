import 'dart:convert';
import 'package:vistox/Modal/homemodal.dart';
import 'package:vistox/Modal/productdiscriptionTap.dart';
import 'package:vistox/api/homeapi.dart';

class HomeRepo {
  HomeApi homeApi = HomeApi();
  Future<SliderModal> fetchHomeSlider(id) async {
    final response = await homeApi.fetchHomeSlider(id);
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return SliderModal(jsonResponse);
  }

  Future<SearchModal> fetchSearch(id) async {
    final response = await homeApi.fetchSearch(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return SearchModal(jsonResponse);
  }

  Future<HomeTabdetailinnnerModal> fetchHometabItems(id) async {
    final response = await homeApi.fetchHometabItems(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return HomeTabdetailinnnerModal(jsonResponse);
  }

  Future<HomeTabModal> fetchHomeTab() async {
    final response = await homeApi.fetchHomeTab();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return HomeTabModal(jsonResponse);
  }

  Future<HomeCusineModal> fetchHomeCusine() async {
    final response = await homeApi.fetchHomeCusine();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return HomeCusineModal(jsonResponse);
  }

  Future<TabModal> fetchmenutab(id) async {
    final response = await homeApi.fetchmenutab(id);
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return TabModal(jsonResponse);
  }

  Future<RatingModal> fetchRatingList(id) async {
    final response = await homeApi.fetchRatingList(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return RatingModal(jsonResponse);
  }

  Future<MenuTabimageModal> fetchmenuImage(id) async {
    final response = await homeApi.fetchmenuImage(id);
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return MenuTabimageModal(jsonResponse);
  }

  Future<ClosetoYouModal> fetchClosetoyou(id) async {
    final response = await homeApi.fetchClosetoyou(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return ClosetoYouModal(jsonResponse);
  }

  Future<OverViewModal> fetchOverview(id, storeid) async {
    final response = await homeApi.fetchOverview(id, storeid);
    var jsonResponse = jsonDecode(response.body) as List;
    return OverViewModal(jsonResponse);
  }

  Future<FeatureModal> fetchFeature(id, storeid) async {
    final response = await homeApi.fetchFeature(id, storeid);
    var jsonResponse = jsonDecode(response.body) as List;
    return FeatureModal(jsonResponse);
  }

  Future<StoreModal> fetchStoredata(id, storeid) async {
    final response = await homeApi.fetchStoredata(id, storeid);
    var jsonResponse = jsonDecode(response.body) as Map;
    return StoreModal(jsonResponse);
  }

  Future<ClosetoYouModal> fetchSection2(id) async {
    final response = await homeApi.fetchSection2(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return ClosetoYouModal(jsonResponse);
  }

  Future<ClosetoYouModal> fetchSection3(id) async {
    final response = await homeApi.fetchSection3(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return ClosetoYouModal(jsonResponse);
  }

  Future<ClosetoYouModal> fetchSection4(id) async {
    final response = await homeApi.fetchSection4(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return ClosetoYouModal(jsonResponse);
  }

  Future<ClosetoYouModal> fetchSupersubcat(id) async {
    final response = await homeApi.fetchSupersubcat(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return ClosetoYouModal(jsonResponse);
  }

  Future<SuperAppModal> fetchHomeCategory() async {
    final response = await homeApi.fetchHomeCategory();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return SuperAppModal(jsonResponse);
  }

  Future<HomeNearbyModal> fetchHomeNearby() async {
    final response = await homeApi.fetchHomeNearby();
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return HomeNearbyModal(jsonResponse);
  }

  Future<SupercatModal> fetchSupercat(id) async {
    final response = await homeApi.fetchSupercat(id);
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    return SupercatModal(jsonResponse);
  }
}
