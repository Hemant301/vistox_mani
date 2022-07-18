import "package:flutter/material.dart";
import 'package:vistox/profileitem/helpSupport.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: new PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Basicappbar(
            title: 'Settings',
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Item(
            title: "Notifications",
            onTap: () {
              Navigator.pushNamed(context, "/notification");
            },
          ),
          Item(
            title: "Manage Delivery Addresses",
          ),
          Item(
            onTap: () {
              Navigator.pushNamed(context, '/faq');
            },
            title: "FAQs",
          ),
          Item(
            title: "About Us",
          ),
          Item(
            title: "Language Settings",
          ),
          Item(
            title: "Contact Settings",
          ),
          Item(
            title: "Community Standards",
          ),
          Item(
            title: "Sign Out",
          ),
        ]),
      ),
      bottomSheet: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Center(child: Text("App Version 1.48.1")),
      ),
    );
  }
}

class Basicappbar extends StatelessWidget {
  Basicappbar({Key? key, this.title = ""}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(1, 2), // changes position of shadow
          )
        ],
      ),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              // color: Colors.grey,
              height: 40,
              width: MediaQuery.of(context).size.width - 30,
              child: Row(children: [
                SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black)),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "$title",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
