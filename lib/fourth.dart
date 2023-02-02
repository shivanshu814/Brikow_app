// ignore: camel_case_types
// ignore_for_file: unnecessary_import, camel_case_types, prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phone_otp_ui/fifth1.dart';
import 'package:phone_otp_ui/main.dart';
import 'package:phone_otp_ui/myverify.dart';

import 'fifth.dart';

class fourth extends StatelessWidget {
  //const fourth({super.key});

  String location, name, date;


  fourth(this.location, this.name, this.date);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    height: 20,
                    child: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Verify(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    width: 330,
                    height: 10,
                    child: const Text(
                      "                                                                 Edit",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  // Card(
                  //   elevation: 5, // the size of the shadow
                  //   shadowColor: Colors.black, // shadow color
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   color: Colors.red.shade100,
                  //   margin: const EdgeInsets.symmetric(
                  //     vertical: 20.0,
                  //     horizontal: 35.0,
                  //   ),
                  //   child: const ListTile(
                  //     title: Text(
                  //       'Project Name          13-12-2022\n\n',
                  //       style: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //           letterSpacing: 1.0,
                  //           fontSize: 15.0),
                  //     ),
                  //     trailing: Icon(
                  //       Icons.location_on_outlined,
                  //       color: Colors.black,
                  //     ),
                  //     subtitle: Text(
                  //       'Location',
                  //       style: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //           letterSpacing: 1.0,
                  //           fontSize: 15.0),
                  //     ),
                  //   ),
                  // ),


                  Container(
                    padding: EdgeInsets.all(5),
                    height: 210,
                      child: GridView.count(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 1,
                          children: List.generate(
                              1,//this is the total number of cards
                                  (index){
                                return Container(
                                  child: Card(
                                      color: Color.fromRGBO(18, 54, 105, 1),
                                      child:Container(
                                        padding: EdgeInsets.all(16),
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "Date: "+date+"\n\n",
                                                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              //mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    flex: 1,child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    Icon(
                                                      Icons.work,
                                                      color: Colors.white,
                                                      //size: 30,
                                                    )
                                                  ],)),
                                                Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text: name.toUpperCase()+"\n\n",
                                                                style: TextStyle(color: Colors.white, fontSize: 18),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],))
                                              ],
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "Location: ",
                                                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),
                                                  ),
                                                  TextSpan(
                                                    text: location,
                                                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            RichText(
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "Material: ",
                                                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),
                                                  ),
                                                  TextSpan(
                                                    text: "Yes"+"\n",
                                                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    //Text(result["response"][index]["Name"]),
                                  ),
                                );
                              }
                          )
                      )
                  ),


                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Functions                                ",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 260,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Fifth(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create Bill",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 260,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const fifth(),
                          ),
                        );
                      },
                      child: const Text(
                        "Employees",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 260,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const fifth(),
                          ),
                        );
                      },
                      child: const Text(
                        "Expenses",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 260,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const fifth(),
                          ),
                        );
                      },
                      child: const Text(
                        "Recieving",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
