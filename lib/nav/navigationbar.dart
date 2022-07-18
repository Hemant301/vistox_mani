import 'package:matcher/matcher.dart';
import 'package:flutter/material.dart';
import 'package:vistox/Home/HomeScreen.dart';
import 'package:vistox/nav/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    switchWithInt() {
      switch (pageIndex) {
        // case 1:
        //   return Category();
        // case 2:
        //   return Profile();
        // case 3:
        //   return Wishlist();
        case 4:
          return Profile();
        case 0:

        default:
          return HomeScreen();
      }
    }

    return Scaffold(
      body: switchWithInt(),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20),
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pageIndex == 0
                        ? Image.asset(
                            "assets/slectbag.png",
                            height: 25,
                            width: 25,
                            // color: pageIndex == 0 ?Color(0xff008ACA)
                            // : Colors.grey[400],/
                          )
                        : Image.asset(
                            "assets/slectbag.png",
                            height: 25,
                            width: 25,
                            color: Colors.grey[400],
                          ),
                    Text(
                      "Shop",
                      style: TextStyle(
                        color: pageIndex == 0
                            ? Color(0xff008ACA)
                            : Colors.grey[400],
                      ),
                    )
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/discount_unselected.png",
                      height: 25,
                      width: 25,
                      color:
                          pageIndex == 1 ? Color(0xff008ACA) : Colors.grey[400],
                    ),
                    Text(
                      "Offers",
                      style: TextStyle(
                        color: pageIndex == 1
                            ? Color(0xff008ACA)
                            : Colors.grey[400],
                      ),
                    )
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/camera_unselected.png",
                      height: 25,
                      width: 25,
                      color:
                          pageIndex == 2 ? Color(0xff008ACA) : Colors.grey[400],
                    ),
                    Text(
                      "Earn",
                      style: TextStyle(
                        color: pageIndex == 2
                            ? Color(0xff008ACA)
                            : Colors.grey[400],
                      ),
                    )
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/feed_unselected.png",
                      height: 25,
                      width: 25,
                      color:
                          pageIndex == 3 ? Color(0xff008ACA) : Colors.grey[400],
                    ),
                    Text(
                      "Feed",
                      style: TextStyle(
                        color: pageIndex == 3
                            ? Color(0xff008ACA)
                            : Colors.grey[400],
                      ),
                    )
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 4;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/account_unselected.png",
                      height: 25,
                      width: 25,
                      color:
                          pageIndex == 4 ? Color(0xff008ACA) : Colors.grey[400],
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                        color: pageIndex == 4
                            ? Color(0xff008ACA)
                            : Colors.grey[400],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
