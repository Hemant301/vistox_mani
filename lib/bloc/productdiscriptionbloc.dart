import 'package:rxdart/subjects.dart';
import 'package:vistox/Modal/productdiscriptionTap.dart';
import 'package:vistox/Modal/productdiscriptionmodal.dart';
import 'package:vistox/repo/productdiscriptionrepo.dart';

import '../Modal/homemodal.dart';

class ProductDiscriptionBloc {
  ProductDiscriptionRepo _productDiscriptionRepo = ProductDiscriptionRepo();

  final BehaviorSubject<ProductDiscriptionModal> _liveproductDiscription =
      BehaviorSubject<ProductDiscriptionModal>();

  BehaviorSubject<ProductDiscriptionModal> get getproductDiscription =>
      _liveproductDiscription;

  fetchproductDiscription(id) async {
    try {
      _liveproductDiscription.addError('error');
      ProductDiscriptionModal productDiscription =
          await _productDiscriptionRepo.fetchProductDiscription(id);
      // print(homeSlider.imgs!.length);

      _liveproductDiscription.add(productDiscription);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<ProductDiscriptionTabModal> _liveproductDiscriptionTab =
      BehaviorSubject<ProductDiscriptionTabModal>();

  BehaviorSubject<ProductDiscriptionTabModal> get getproductDiscriptionTab =>
      _liveproductDiscriptionTab;

  fetchProductDiscriptionTab(id) async {
    try {
      _liveproductDiscriptionTab.addError('error');
      ProductDiscriptionTabModal productDiscriptiontab =
          await _productDiscriptionRepo.fetchProductDiscriptionTab(id);
      // print(homeSlider.imgs!.length);

      _liveproductDiscriptionTab.add(productDiscriptiontab);
    } catch (e) {
      print(e);
    }
  }
}

final ProductDiscriptionBlocss = ProductDiscriptionBloc();
