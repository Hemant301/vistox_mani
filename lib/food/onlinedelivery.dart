import "package:flutter/material.dart";


class OnlineFoodDelivery extends StatelessWidget {
  const OnlineFoodDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
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
                  Container(
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
              SizedBox(
                height: 20,
              ),

      ]),
    ));
    
  }
}