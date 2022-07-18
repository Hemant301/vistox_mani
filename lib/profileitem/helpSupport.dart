import "package:flutter/material.dart";

class helpSupport extends StatelessWidget {
  const helpSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        appBar: new PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
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
                          "Help & Support",
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
            )),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Item(
              title: "Cashback on Bills",
            ),
            Item(
              title: "Voucher",
            ),
            Item(
              title: "Home Delivery",
            ),
            Item(
              title: "Payments / Wallets",
            ),
            Item(
              title: "App related / Other",
            ),
            Item(
              title: "Privacy",
            ),
            Item(
              title: "Referral and Promotional Rewards",
            ),
            Item(
              title: "Coupon codes",
            ),
            Item(
              title: "Gaming (Quest/Hopper)",
            ),
          ]),
        ));
  }
}

class Item extends StatelessWidget {
  Item({
    Key? key,
    this.onTap,
    this.icon,
    this.title,
  }) : super(key: key);
  void Function()? onTap;
  IconData? icon;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  child: Text(
                    title!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black, letterSpacing: 1, fontSize: 18
                        // fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
