class ProductDiscriptionModal {
  List<Overview>? overview;
  List<Offers>? offers;
  List<Menu>? menu;
  List<Review>? review;
  List<Related_store>? related_store;

  ProductDiscriptionModal(js) {
    overview = [];
    for (int i = 0; i < js["overview"].length; i++) {
      overview!.add(Overview(js["overview"][i]));
    }
    offers = [];
    for (int i = 0; i < js["offers"].length; i++) {
      offers!.add(Offers(js["offers"][i]));
    }
    menu = [];
    for (int i = 0; i < js["menu"].length; i++) {
      menu!.add(Menu(js["menu"][i]));
    }
    review = [];
    for (int i = 0; i < js["review"].length; i++) {
      review!.add(Review(js["review"][i]));
    }
    related_store = [];
    for (int i = 0; i < js["related_store"].length; i++) {
      related_store!.add(Related_store(js["related_store"][i]));
    }
  }
}

class Overview {
  Overview(js) {}
}

class Offers {
  Offers(js) {}
}

class Menu {
  Menu(js) {}
}

class Review {
  Review(js) {}
}

class Related_store {
  String? store_id;
  String? store_name;
  String? store_image;
  String? store_avg_price;
  String? city_name;

  Related_store(js) {
    store_id = js['store_id'] ?? '';
    store_name = js['store_name'] ?? '';
    store_image = js['store_image'] ?? '';
    store_avg_price = js['store_avg_price'] ?? '';
    city_name = js['city_name'] ?? '';
  }
}
