class SliderModal {
  List<SliderimgModal> data = [];
  SliderModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(SliderimgModal(js[i]));
    }
  }
}

class SliderimgModal {
  String? img;

  SliderimgModal(js) {
    img = js['img'] ?? "";
  }
}

class TabModal {
  List<TabDetailModal> data = [];
  TabModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(TabDetailModal(js[i]));
    }
  }
}

class TabDetailModal {
  String? name;
  String? id;

  TabDetailModal(js) {
    name = js['name'] ?? "";
    id = js['id'] ?? "";
  }
}

class MenuTabimageModal {
  List<MenuTabModal> data = [];
  MenuTabimageModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(MenuTabModal(js[i]));
    }
  }
}

class MenuTabModal {
  String? menu_image;
  String? id;

  MenuTabModal(js) {
    menu_image = js['menu_image'] ?? "";
    id = js['id'] ?? "";
  }
}

class SuperAppModal {
  List<SupercatdetailModal> data = [];
  SuperAppModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(SupercatdetailModal(js[i]));
    }
  }
}

class SupercatdetailModal {
  String? super_app_id;
  String? name;
  String? image;

  SupercatdetailModal(js) {
    super_app_id = js['super_app_id'] ?? "";
    name = js['name'] ?? "";
    image = js['image'] ?? "";
  }
}

class HomeNearbyModal {
  List<HomeNearbydetailModal> data = [];
  HomeNearbyModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(HomeNearbydetailModal(js[i]));
    }
  }
}

class HomeNearbydetailModal {
  String? id;
  String? name;
  String? image;
  String? discount;
  String? rating;
  String? location;

  HomeNearbydetailModal(js) {
    id = js['id'] ?? "";
    name = js['name'] ?? "";
    image = js['image'] ?? "";
    discount = js['discount'] ?? "";
    rating = js['rating'] ?? "";
    location = js['location'] ?? "";
  }
}

class SupercatModal {
  List<SupercategorydetailModal> data = [];
  SupercatModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(SupercategorydetailModal(js[i]));
    }
  }
}

class SupercategorydetailModal {
  String? id;
  String? name;
  String? image;

  SupercategorydetailModal(js) {
    id = js['super_id'] ?? "";
    name = js['name'] ?? "";
    image = js['image'] ?? "";
  }
}

class ClosetoYouModal {
  String? title;
  List<CloseStoreListModal> store = [];
  ClosetoYouModal(js) {
    title = js['title'] ?? "";
    for (var i = 0; i < js['store'].length; i++) {
      store.add(CloseStoreListModal(js['store'][i]));
    }
  }
}

class CloseStoreListModal {
  String? storename;
  String? storeid;
  String? storeimage;
  String? cityname;
  CloseStoreListModal(js) {
    storename = js['store_name'] ?? "";
    storeid = js['store_id'] ?? "";
    storeimage = js['store_image'] ?? "";
    cityname = js['city_name'] ?? "";
  }
}

class OverViewModal {
  List<OverviewdetailModal> overview = [];
  OverViewModal(js) {
    for (var i = 0; i < js.length; i++) {
      overview.add(OverviewdetailModal(js[i]));
    }
  }
}

class OverviewdetailModal {
  String? id;
  String? title;
  String? desc;
  OverviewdetailModal(js) {
    id = js['id'] ?? "";
    title = js['title'] ?? "";
    desc = js['description'] ?? "";
  }
}

class FeatureModal {
  List<FeaturedetailModal> overview = [];
  FeatureModal(js) {
    for (var i = 0; i < js.length; i++) {
      overview.add(FeaturedetailModal(js[i]));
    }
  }
}

class FeaturedetailModal {
  String? id;
  String? title;
  // String? desc;
  FeaturedetailModal(js) {
    id = js['id'] ?? "";
    title = js['title'] ?? "";
    // desc = js['description'] ?? "";
  }
}

class StoreModal {
  String? id;
  String? store_name;
  String? store_description;
  String? short_description;
  List<Storeimage> store_image = [];
  String? store_address;
  int? is_open;
  String? close_time;
  String? avg_price;
  String? key_feature;
  StoreModal(js) {
    id = js['id'] ?? "";
    store_name = js['store_name'] ?? "";
    store_description = js['store_description'] ?? "";
    short_description = js['short_description'] ?? "";
    // store_image = js['store_image'] ?? "";
    store_address = js['store_address'] ?? "";
    is_open = js['is_open'] ?? "";
    close_time = js['close_time'] ?? "";
    avg_price = js['avg_price'] ?? "";
    key_feature = js['key_feature'] ?? "";
    for (var i = 0; i < js['store_image'].length; i++) {
      store_image.add(Storeimage(js['store_image'][i]));
    }
  }
}

class Storeimage {
  String? img;
  Storeimage(js) {
    img = js['img'] ?? "";
  }
}

class RatingModal {
  RatesModal? rating;
  List<ReviewModal> review = [];
  RatingModal(js) {
    rating = RatesModal(js['rating']);
    for (var i = 0; i < js['review'].length; i++) {
      review.add(ReviewModal(js['review'][i]));
    }
  }
}

class RatesModal {
  dynamic? rating;
  int? exc_rating;
  int? good_rating;
  int? avg_rating;
  int? poor_rating;
  int? bad_rating;
  RatesModal(js) {
    rating = js['rating'] ?? 0;
    exc_rating = js['exc_rating'] ?? 0;
    good_rating = js['good_rating'] ?? 0;
    avg_rating = js['avg_rating'] ?? 0;
    poor_rating = js['poor_rating'] ?? 0;
    bad_rating = js['bad_rating'] ?? 0;
  }
}

class ReviewModal {
  String? user_name;
  String? user_image;
  String? comment;
  String? review_image;
  ReviewModal(js) {
    user_name = js["user_name"] ?? "";
    user_image = js["user_image"] ?? "";
    comment = js["comment"] ?? "";
    review_image = js["review_image"] ?? "";
  }
}

class HomeTabModal {
  List<HomeTabDetailModal> data = [];
  HomeTabModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(HomeTabDetailModal(js[i]));
    }
  }
}

class HomeTabDetailModal {
  String? super_app_id;
  String? name;

  HomeTabDetailModal(js) {
    name = js['name'] ?? "";
    super_app_id = js['super_app_id'] ?? "";
  }
}

class HomeTabdetailinnnerModal {
  List<HomeTabdegtailsModal> data = [];
  HomeTabdetailinnnerModal(js) {
    for (var i = 0; i < js["store"].length; i++) {
      data.add(HomeTabdegtailsModal(js["store"][i]));
    }
  }
}

class HomeTabdegtailsModal {
  String? store_name;
  String? store_image;
  String? city_name;
  String? distance;
  String? store_address;
  String? rating;

  HomeTabdegtailsModal(js) {
    store_name = js['store_name'] ?? "";
    store_image = js['store_image'] ?? "";
    city_name = js['city_name'] ?? "";
    distance = js['distance'] ?? "";
    store_address = js['store_address'] ?? "";
    rating = js['rating'] ?? "";
  }
}

class HomeCusineModal {
  List<HomeCusineDetailModal> data = [];
  HomeCusineModal(js) {
    for (var i = 0; i < js.length; i++) {
      data.add(HomeCusineDetailModal(js[i]));
    }
  }
}

class HomeCusineDetailModal {
  String? id;
  String? name;
  String? image;

  HomeCusineDetailModal(js) {
    name = js['name'] ?? "";
    id = js['id'] ?? "";
    image = js['image'] ?? "";
  }
}
