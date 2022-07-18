class ProductDiscriptionTabModal {
  List<ProductDiscriptionTabsModal> tab = [];
  ProductDiscriptionTabModal(js) {
    for (var i = 0; i < js.length; i++) {
      tab.add(ProductDiscriptionTabsModal(js[i]));
    }
  }
}

class ProductDiscriptionTabsModal {
  String? id;
  String? name;

  ProductDiscriptionTabsModal(js) {
    id = js['id'] ?? "";
    name = js['name'] ?? "";
  }
}

class SearchModal {
  List<StoreListModal> store = [];
  SearchModal(js) {
    for (var i = 0; i < js['store'].length; i++) {
      store.add(StoreListModal(js["store"][i]));
    }
  }
}

class StoreListModal {
  String? store_name;
  String? store_image;
  String? rating;
  String? distance;
  String? city_name;
  String? store_address;
  List<FooditemsModal> fooditems = [];
  StoreListModal(js) {
    store_name = js['store_name'] ?? "";
    store_image = js['store_image'] ?? "";
    rating = js['rating'] ?? "";
    distance = js['distance'] ?? "";
    store_address = js['store_address'] ?? "";
    city_name = js['city_name'] ?? "";
    for (var i = 0; i < js["food_item"].length; i++) {
      fooditems.add(FooditemsModal(js["food_item"][i]));
    }
  }
}

class FooditemsModal {
  String? item_id;
  String? item_name;
  String? item_image;
  dynamic item_price;
  FooditemsModal(js) {
    item_id = js['item_id'] ?? "";
    item_name = js['item_name'] ?? "";
    item_image = js['item_image'] ?? "";
    item_price = js['item_price'] ?? "";
  }
}
