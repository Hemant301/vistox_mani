import 'package:rxdart/rxdart.dart';
import 'package:vistox/Modal/homemodal.dart';
import 'package:vistox/Modal/productdiscriptionTap.dart';
import 'package:vistox/repo/homerepo.dart';

class HomeBloc {
  HomeRepo _homeRepo = HomeRepo();
  final BehaviorSubject<SliderModal> _liveSlider =
      BehaviorSubject<SliderModal>();

  BehaviorSubject<SliderModal> get getHomeSlider => _liveSlider;

  fetchHomeSlider(id) async {
    try {
      _liveSlider.addError('error');
      SliderModal homeSlider = await _homeRepo.fetchHomeSlider(id);
      // print(homeSlider.imgs!.length);

      _liveSlider.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SearchModal> _liveSearch =
      BehaviorSubject<SearchModal>();

  BehaviorSubject<SearchModal> get getSearch => _liveSearch;

  fetchSearch(id) async {
    try {
      SearchModal homeSlider = await _homeRepo.fetchSearch(id);
      // print(homeSlider.imgs!.length);

      _liveSearch.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<HomeTabdetailinnnerModal> _liveTabDetail =
      BehaviorSubject<HomeTabdetailinnnerModal>();

  BehaviorSubject<HomeTabdetailinnnerModal> get gettabdetail => _liveTabDetail;

  fetchHometabItems(id) async {
    try {
      _liveTabDetail.addError('error');
      HomeTabdetailinnnerModal homeSlider =
          await _homeRepo.fetchHometabItems(id);
      // print(homeSlider.imgs!.length);

      _liveTabDetail.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<HomeTabModal> _liveTab =
      BehaviorSubject<HomeTabModal>();

  BehaviorSubject<HomeTabModal> get getHomeTab => _liveTab;

  fetchHomeTab() async {
    try {
      _liveTab.addError('error');
      HomeTabModal homeSlider = await _homeRepo.fetchHomeTab();
      // print(homeSlider.imgs!.length);

      _liveTab.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<HomeCusineModal> _liveHomecusine =
      BehaviorSubject<HomeCusineModal>();

  BehaviorSubject<HomeCusineModal> get getHomeCusine => _liveHomecusine;

  fetchHomeCusine() async {
    try {
      _liveHomecusine.addError('error');
      HomeCusineModal homeSlider = await _homeRepo.fetchHomeCusine();
      // print(homeSlider.imgs!.length);

      _liveHomecusine.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<TabModal> _livemenuTab = BehaviorSubject<TabModal>();

  BehaviorSubject<TabModal> get getMenuTab => _livemenuTab;

  fetchmenutab(id) async {
    try {
      _livemenuTab.addError('error');
      TabModal homeSlider = await _homeRepo.fetchmenutab(id);
      // print(homeSlider.imgs!.length);

      _livemenuTab.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<RatingModal> _liveRatingList =
      BehaviorSubject<RatingModal>();

  BehaviorSubject<RatingModal> get getRatingList => _liveRatingList;

  fetchRatingList(id) async {
    try {
      RatingModal homeSlider = await _homeRepo.fetchRatingList(id);
      // print(homeSlider.imgs!.length);

      _liveRatingList.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<MenuTabimageModal> _liveMenuImage =
      BehaviorSubject<MenuTabimageModal>();

  BehaviorSubject<MenuTabimageModal> get getMenuimage => _liveMenuImage;

  fetchmenuImage(id) async {
    try {
      _liveMenuImage.addError('error');
      MenuTabimageModal homeSlider = await _homeRepo.fetchmenuImage(id);
      // print(homeSlider.imgs!.length);

      _liveMenuImage.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<ClosetoYouModal> _liveClosetoyou =
      BehaviorSubject<ClosetoYouModal>();

  BehaviorSubject<ClosetoYouModal> get getClosetoyou => _liveClosetoyou;

  fetchClosetoyou(id) async {
    try {
      _liveClosetoyou.addError('error');
      ClosetoYouModal homeSlider = await _homeRepo.fetchClosetoyou(id);
      // print(homeSlider.imgs!.length);

      _liveClosetoyou.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<OverViewModal> _liveStoreId =
      BehaviorSubject<OverViewModal>();

  BehaviorSubject<OverViewModal> get getOverview => _liveStoreId;

  fetchOverview(id, storeid) async {
    try {
      _liveStoreId.addError('error');
      OverViewModal homeSlider = await _homeRepo.fetchOverview(id, storeid);
      // print(homeSlider.imgs!.length);

      _liveStoreId.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<FeatureModal> _liveFeatures =
      BehaviorSubject<FeatureModal>();

  BehaviorSubject<FeatureModal> get getfeatures => _liveFeatures;

  fetchFeature(id, storeid) async {
    try {
      _liveFeatures.addError('error');
      FeatureModal homeSlider = await _homeRepo.fetchFeature(id, storeid);
      // print(homeSlider.imgs!.length);

      _liveFeatures.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<StoreModal> _liveStoredata =
      BehaviorSubject<StoreModal>();

  BehaviorSubject<StoreModal> get getStaoredata => _liveStoredata;

  fetchStoredata(id, storeid) async {
    try {
      _liveStoredata.addError('error');
      StoreModal homeSlider = await _homeRepo.fetchStoredata(id, storeid);
      // print(homeSlider.imgs!.length);

      _liveStoredata.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<ClosetoYouModal> _liveSection2 =
      BehaviorSubject<ClosetoYouModal>();

  BehaviorSubject<ClosetoYouModal> get getSection2 => _liveSection2;

  fetchSection2(id) async {
    try {
      _liveSection2.addError('error');
      ClosetoYouModal homeSlider = await _homeRepo.fetchSection2(id);
      // print(homeSlider.imgs!.length);

      _liveSection2.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<ClosetoYouModal> _liveSection3 =
      BehaviorSubject<ClosetoYouModal>();

  BehaviorSubject<ClosetoYouModal> get getSection3 => _liveSection3;

  fetchSection3(id) async {
    try {
      _liveSection3.addError('error');
      ClosetoYouModal homeSlider = await _homeRepo.fetchSection3(id);
      // print(homeSlider.imgs!.length);

      _liveSection3.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<ClosetoYouModal> _liveSection4 =
      BehaviorSubject<ClosetoYouModal>();

  BehaviorSubject<ClosetoYouModal> get getSection4 => _liveSection4;

  fetchSection4(id) async {
    try {
      _liveSection4.addError('error');
      ClosetoYouModal homeSlider = await _homeRepo.fetchSection4(id);
      // print(homeSlider.imgs!.length);

      _liveSection4.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<ClosetoYouModal> _liveSupersubcat =
      BehaviorSubject<ClosetoYouModal>();

  BehaviorSubject<ClosetoYouModal> get getSupersubcat => _liveSupersubcat;

  fetchSupersubcat(id) async {
    try {
      _liveSupersubcat.addError('error');
      ClosetoYouModal homeSlider = await _homeRepo.fetchSupersubcat(id);
      // print(homeSlider.imgs!.length);

      _liveSupersubcat.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SuperAppModal> _liveHomecategory =
      BehaviorSubject<SuperAppModal>();

  BehaviorSubject<SuperAppModal> get getHomeCategory => _liveHomecategory;

  fetchHomeCategory() async {
    try {
      SuperAppModal homeSlider = await _homeRepo.fetchHomeCategory();
      // print(homeSlider.imgs!.length);

      _liveHomecategory.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<HomeNearbyModal> _liveHomeNearby =
      BehaviorSubject<HomeNearbyModal>();

  BehaviorSubject<HomeNearbyModal> get getHomeNearby => _liveHomeNearby;

  fetchHomeNearby() async {
    try {
      HomeNearbyModal homeSlider = await _homeRepo.fetchHomeNearby();
      // print(homeSlider.imgs!.length);

      _liveHomeNearby.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SupercatModal> _liveSupercat =
      BehaviorSubject<SupercatModal>();

  BehaviorSubject<SupercatModal> get getSupercat => _liveSupercat;

  fetchSupercat(id) async {
    try {
      SupercatModal homeSlider = await _homeRepo.fetchSupercat(id);
      // print(homeSlider.imgs!.length);

      _liveSupercat.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }
}

final homebloc = HomeBloc();
