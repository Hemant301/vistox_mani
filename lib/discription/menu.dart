import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:vistox/Modal/homemodal.dart';
import 'package:vistox/api/homeapi.dart';
import 'package:vistox/bloc/homebloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int activeIndexfoMenu = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
    homebloc.fetchmenutab('2');
  }

  check() async {
    List data = await homeapi.getMenuid(id: "2");
    print(data[0]['id']);
    setState(() {
      activeIndexfoMenu = int.parse(data[0]['id']);
      homebloc.fetchmenuImage("$activeIndexfoMenu");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StreamBuilder<TabModal>(
          stream: homebloc.getMenuTab.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                  snapshot.data!.data.length,
                  (index) => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          // print(activeIndexfoMenu);
                          // print(int.parse(snapshot.data!.data[index].id!));
                          // print(activeIndexfoMenu ==
                          //     int.parse(snapshot.data!.data[index].id!));
                          // return;
                          setState(() {
                            activeIndexfoMenu =
                                int.parse(snapshot.data!.data[index].id!);
                            homebloc.fetchmenuImage('$activeIndexfoMenu');
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: activeIndexfoMenu ==
                                    int.parse(snapshot.data!.data[index].id!)
                                ? Color.fromARGB(255, 18, 94, 226)
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45.withOpacity(.1),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(1, 2), // changes position of shadow
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            snapshot.data!.data[index].name!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: activeIndexfoMenu ==
                                        int.parse(
                                            snapshot.data!.data[index].id!)
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      )),
                )));
          }),
      StreamBuilder<MenuTabimageModal>(
          stream: homebloc.getMenuimage.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return Column(
                children: List.generate(
                    snapshot.data!.data.length,
                    (index) => Container(
                        child: Image.network(
                            snapshot.data!.data[index].menu_image!))));
          })
    ]);
  }
}
