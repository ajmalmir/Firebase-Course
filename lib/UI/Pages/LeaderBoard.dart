import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_course/Widgets/Colors_Ui.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
          child: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            // ! Stack --------------------------------------------------{Started}

            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                // ! Stack

                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      height: 280,
                    )
                  ],
                ),
                Positioned(
                    top: 20,
                    bottom: 10,
                    child: Row(
                      children: [
                        //! King 2
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            sdh(40),
                            Container(
                                height: 30,
                                width: 30,
                                child: Image.asset('images/number-2.png')),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: white, width: 2.0),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  )),
                              width: 70,
                              height: 70,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                child: Image.network(
                                  'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            sdh(5),
                            // ! Earnings
                            Text(
                              '3575',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            sdh(5),
                            // ! Name
                            Text(
                              'Alisha Ali',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        sdw(10),
                        //! King 1
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                child:
                                    Image.asset('images/king.png', scale: 2.0)),

                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: white, width: 2.0),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100),
                                  )),
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                child: Image.network(
                                  'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            sdh(5),
                            // ! Earnings
                            Text(
                              '3575',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            sdh(5),
                            // ! Name
                            Text(
                              'Mahi khan',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        sdw(10),
                        //! King 3
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            sdh(40),
                            Container(
                                height: 30,
                                width: 30,
                                child: Image.asset('images/number-3.png')),

                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: white, width: 2.0),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  )),
                              width: 70,
                              height: 70,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                child: Image.network(
                                  'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            sdh(5),
                            // ! Earnings
                            Text(
                              '3575',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            sdh(5),
                            // ! Name
                            Text(
                              'Talya Murad',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
            // ! Stack --------------------------------------------------{Ended}

            // ! StreamBuilder ------------------------------------------{Started}

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('appsdata')
                      .snapshots(),
                  builder: (context, snapshot) {
                    final list = [];
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    if (snapshot.hasData) {
                      final data = snapshot.data?.docs;
                      for (var i in data!) {
                        list.add(i.data());
                      }
                    }
                    return Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                final doucment = list[index];

                                // !Designing Strated here---------------------

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 5),
                                  child: Container(
                                    width: double.infinity,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // ! Image-------------------------------
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: white,
                                                        width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(50),
                                                      topRight:
                                                          Radius.circular(50),
                                                      bottomLeft:
                                                          Radius.circular(50),
                                                      bottomRight:
                                                          Radius.circular(50),
                                                    )),
                                                width: 50,
                                                height: 50,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(100)),
                                                  child: Image.network(
                                                    doucment['Img'],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              sdw(10),
                                              // ! Name--------------------------------------
                                              Text(
                                                doucment['appsname'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          // ! Price--------------------------------------
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee_outlined,
                                              ),
                                              Text(
                                                doucment['appsprice'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );

                                // !
                              }),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
            // ! StreamBuilder ------------------------------------------{Ended}
          ],
        ),
      )),
    );
  }
}

// ! Sizebox------------------------------------------
Widget sdh(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sdw(double width) {
  return SizedBox(
    width: width,
  );
}
