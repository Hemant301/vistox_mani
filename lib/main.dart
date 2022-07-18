import 'package:flutter/material.dart';
import 'package:vistox/Home/HomeScreen.dart';
import 'package:vistox/Home/category.dart';
import 'package:vistox/Home/shopmenu.dart';

import 'package:vistox/discription/productdiscription.dart';
import 'package:vistox/extera/bill.dart';
import 'package:vistox/food/shop.dart';

import 'package:vistox/nav/navigationbar.dart';
import 'package:vistox/pincode/mannual.dart';
import 'package:vistox/pincode/oops.dart';
import 'package:vistox/pincode/pincode.dart';
import 'package:vistox/profileitem/helpSupport.dart';
import 'package:vistox/profileitem/notification.dart';
import 'package:vistox/profileitem/setting.dart';
import 'package:vistox/screen/faq.dart';
import 'package:vistox/search/categorysearch.dart';
import 'package:vistox/utils/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RGC',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
            // fontFamily: font,
            ),
        initialRoute: ('/pincode/auto'),
        routes: {
          "/HomeScreen": (context) => HomeScreen(),
          "/navigationbar": (context) => NavBar(),
          "/category": (context) => Category(),
          "/helpSupport": (context) => helpSupport(),
          "/setting": (context) => Settings(),
          "/notification": (context) => NotificationPage(),
          "/productdiscription": (context) => ProductDiscription(),
          "/faq": (context) => Faq(),
          '/pincode/auto': (context) => PincodePage(),
          '/pincode/mannual': (context) => MannualPage(),
          '/pincode/oops': (context) => OopsPage(),
          '/bill': (context) => Bill(),
          '/shop': (context) => ShopPage(),
          '/categorysearch': (context) => CategorySearchPage(),

          '/shopmenu': (context) => ShopMenu(),

          // '/shop': (context) => ShopPage(),categorysearch

          


        });
  }
}
