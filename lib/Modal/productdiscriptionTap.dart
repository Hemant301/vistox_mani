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
