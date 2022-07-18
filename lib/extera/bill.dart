import 'package:flutter/material.dart';



class Bill extends StatelessWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(backgroundBlendMode: BlendMode.colorBurn,
            color: Colors.blue,
            ),
            child: Column
            (mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/dummy/WhatsApp_Image_2022-07-12_at_10.02.30_PM-removebg-preview.png",width: MediaQuery.of(context).size.width/3,),
                ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child:   Center(
      child: Text(
                                          
                                          "AEPS CASH WITHDRAWAL",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
      ),
    ), Padding(
      padding: const EdgeInsets.all(8.0),
      child:   Center(
      child: Text(
                                          
                                          "Transaction Details",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.orange,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
      ),
    ),Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                                            
                                            "08/07/2022",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Colors.black,
                                                // letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
            ),  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                                            
                                            "11:27:10",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Colors.black,
                                                // letterSpacing: 1,
                                               fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
            ),
      ],
    ),
    BillItem(
      title:"Availabal Balance:",
      subtitle: "100",
    ), BillItem(
      title:"Transaction Id:",
      subtitle: "1234567895",
    ),
       BillItem(
      title:"Ref Id.:",
      subtitle: "M72551h554",
    ),  BillItem(
      title:"Mode:",
      subtitle: "CW",
    ), BillItem(
      title:"Adhar No:",
      subtitle: "XXXXXXXX555",
    ),BillItem(
      title:"Mobile No:",
      subtitle: "8210925188",
    )
      ,BillItem(
      title:"Bank Message:",
      subtitle: "Your Fingaar authentication is diaabled",
    ),
    SizedBox(height: 60,)
    ,
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
                                          
                                          "Customer Care",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black,
                                              // letterSpacing: 1,
                                            fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
        ),  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width/2.2,
              child: Text(

                                            
                                         "Merchant Mobile No",
                                            textAlign: TextAlign.end,
                                            
                                            style: TextStyle(
                                                color: Colors.black,
                                                // letterSpacing: 1,
                                               fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
            ),
        ),
      ],
    ),
   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
                                          
                                          "support@moneyproPay.com",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              // letterSpacing: 1,
                                            fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
        ),  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width/2.2,
              child: Text(

                                            
                                         "7742256633",
                                            textAlign: TextAlign.end,
                                            
                                            style: TextStyle(
                                                color: Colors.blue,
                                                // letterSpacing: 1,
                                               fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
            ),
        ),
      ],
    )
   
            ]),
          ),
        ),
      ),
    );
    
  }
}
class BillItem extends StatelessWidget {
   BillItem({
    Key? key,this.title,this.subtitle
  }) : super(key: key);
String ?title;
String ?subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
                                        
                                        title!,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black,
                                            // letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
        ),  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width/2.2,
            child: Text(

                                          
                                          subtitle!,
                                          textAlign: TextAlign.end,
                                          
                                          style: TextStyle(
                                              color: Colors.black,
                                              // letterSpacing: 1,
                                             fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
          ),
        ),
      ],
    );
  }
}

