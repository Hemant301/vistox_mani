import "package:flutter/material.dart";


class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: new PreferredSize(
          preferredSize: Size.fromHeight(100),
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(child: Image.asset("assets/logo.png")),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 202, 195, 195)),
                          ),
                          child: Row(children: const [
                            Text("Andheri East"),
                            Icon(Icons.arrow_drop_down)
                          ]),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [
                                  0.1,
                                  0.4,
                                  0.6,
                                  0.9,
                                ],
                                colors: [
                                  Colors.yellow,
                                  Color.fromARGB(255, 234, 189, 84),
                                  Color.fromARGB(255, 216, 170, 18),
                                  Color.fromARGB(255, 255, 183, 0),
                                ],
                              )
                              // border: Border.all(color: Color.fromARGB(255, 202, 195, 195)
                              // ),
                              ),
                          // width: MediaQuery.of(context).size.width / 5,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/wallet 1.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("100"),
                              ]),
                        ),
                        // Icon(Icons.search),
                        Icon(Icons.notification_add)
                      ]),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/categorysearch");
                    },
                    child: Container(
                      // color: Colors.grey,
                      height: 40,
                      width: MediaQuery.of(context).size.width - 30,
                      child: Row(children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.search, color: Colors.grey[500]),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            "Tap here to search for stores ,product,brands,etc",
                            style:
                                TextStyle(color: Colors.grey[400], fontSize: 10),
                          ),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                                "Primium",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
              ),
              Center(child: ShopItem())
              ])));
  }
}


class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          5,
          (index) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width / 3 - 10,
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/dummy/macdonal.png",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          Positioned(
                            top: -30,
                            child: Transform.rotate(
                              angle: 19.7,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(
                                        color: Color.fromARGB(238, 255, 200, 0))),
                                height: 100,
                                width: 35,
                                child: Transform.rotate(
                                    angle: 4.8,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Save 30%",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 7),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Text(
                                        "4.5",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )))
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: Text(
                                "Nike Andheri Sports Superstore",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.pin_drop,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '8km',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: ' sector 3',
                                          style:
                                              TextStyle(color: Colors.black54)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width / 2.5,
                            color: Colors.grey,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Text(
                                "Quick Bites, 400 for two",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              )),
                          Container(
                              // padding: EdgeInsets.symmetric(vertical: 3),
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Text(
                                "2504 bought, last redeemed yesterday",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
