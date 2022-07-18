import 'package:flutter/material.dart';
import 'package:vistox/nav/profileSlider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
                        Icon(Icons.search, color: Colors.grey[500]),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            "Tap here to search for stores ,product,brands,etc",
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                        Icon(Icons.notifications, color: Colors.black),
                      ]),
                    )
                  ],
                ),
              ),
            )),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      "assets/dummy/valeriia-bugaiova-_pPHgeHz1uk-unsplash 1.png"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Victoria Robertson",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Edit profile, bookmarks, albums",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.grey[500],
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.grey[500],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
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
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                  child: Text(
                    "FIND FRIENDS",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ProfileItem(
                title: "My Transactions",
                icon: Icons.book,
              ),
              ProfileItem(
                title: "Easy Rewards",
                icon: Icons.book,
              ),
              ProfileItem(
                title: "Help & Support",
                icon: Icons.book,
                onTap: () {
                  Navigator.pushNamed(context, "/helpSupport");
                },
              ),
              ProfileItem(
                title: "Settings",
                icon: Icons.book,
                onTap: () {
                  Navigator.pushNamed(context, "/setting");
                },
              ),
              ProfileItem(
                title: "Refer and Earn",
                icon: Icons.book,
              ),
              SizedBox(
                height: 30,
              ),
              ProfileSlider1()
            ],
          ),
        ));
  }
}

class ProfileItem extends StatelessWidget {
  ProfileItem({
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                Icon(
                  icon,
                  color: Colors.grey[500],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.grey[500],
                    letterSpacing: 1,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[500],
            )
          ],
        ),
      ),
    );
  }
}
