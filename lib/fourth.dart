// ignore: camel_case_types
// ignore_for_file: unnecessary_import, camel_case_types, prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phone_otp_ui/fifth1.dart';
import 'package:phone_otp_ui/main.dart';
import 'package:phone_otp_ui/myverify.dart';
import 'package:phone_otp_ui/third.dart';

import 'fifth.dart';

class fourth extends StatelessWidget {
  //const fourth({super.key});

  String location, name, date;

  fourth(this.location, this.name, this.date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            //SizedBox(height: 20,),
            Expanded(child: Container(
              padding: EdgeInsets.only(left: 15,right: 15),
                child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(child: Icon(Icons.arrow_back_ios),onTap: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => third(),
                    ),
                  );
                },),
                Text(name.toUpperCase(),style:TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.w400))
              ],
            )),),
            Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                      //padding: EdgeInsets.all(15),
                      //height: 230,
                      child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 1,
                          childAspectRatio: (1 / 0.55),
                          children: List.generate(
                              1, //this is the total number of cards
                              (index) {
                            return Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    //set border radius more than 50% of height and width to make circle
                                  ),
                                elevation: 10,
                                  color: Colors.white,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                            color: Color.fromRGBO(113, 63, 250, 1),
                                            //
                                          ),
                                          child: Text(
                                              name.toUpperCase(),
                                              textAlign: TextAlign.left,
                                              style:  TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w200)
                                          ),

                                          width: double.infinity,
                                          padding: EdgeInsets.all(15),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                            Text(
                                                "Date: "+date,
                                                textAlign: TextAlign.left,
                                                style:  TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w300)
                                            ),
                                              SizedBox(height: 5,),
                                            Text(
                                                "With Material: Yes",
                                                textAlign: TextAlign.left,
                                                style:  TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w300)
                                            ),
                                            SizedBox(height: 15,),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on),
                                                Text(
                                                    "Location: "+location,
                                                    textAlign: TextAlign.left,
                                                    style:  TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w300)
                                                ),
                                              ],
                                            )

                                          ],),
                                        ),
                                        // RichText(
                                        //   text: TextSpan(
                                        //     children: <TextSpan>[
                                        //       TextSpan(
                                        //         text: "Date: " + date + "\n",
                                        //         style: TextStyle(
                                        //             color: Colors.black54
                                        //                 .withOpacity(0.7),
                                        //             fontSize: 14),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // Row(
                                        //   crossAxisAlignment:
                                        //   CrossAxisAlignment.start,
                                        //   //mainAxisAlignment: MainAxisAlignment.start,
                                        //   children: [
                                        //     Expanded(
                                        //         flex: 1,
                                        //         child: Column(
                                        //           crossAxisAlignment:
                                        //           CrossAxisAlignment
                                        //               .stretch,
                                        //           children: [
                                        //             Icon(
                                        //               Icons.work,
                                        //               color: Colors.white,
                                        //               //size: 30,
                                        //             )
                                        //           ],
                                        //         )),
                                        //     Expanded(
                                        //       flex: 2,
                                        //       child: Column(
                                        //         crossAxisAlignment:
                                        //         CrossAxisAlignment.start,
                                        //         children: [
                                        //           RichText(
                                        //             text: TextSpan(
                                        //               children: <TextSpan>[
                                        //                 TextSpan(
                                        //                   text:
                                        //                   name.toUpperCase() +
                                        //                       "\n",
                                        //                   style: TextStyle(
                                        //                       color:
                                        //                       Colors.black,
                                        //                       fontSize: 18),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        // RichText(
                                        //   text: TextSpan(
                                        //     children: <TextSpan>[
                                        //       TextSpan(
                                        //         text: "Location: ",
                                        //         style: TextStyle(
                                        //             color: Colors.black
                                        //                 .withOpacity(0.5),
                                        //             fontSize: 14),
                                        //       ),
                                        //       TextSpan(
                                        //         text: location,
                                        //         style: TextStyle(
                                        //             color: Colors.black
                                        //                 .withOpacity(0.8),
                                        //             fontSize: 14),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        // RichText(
                                        //   text: TextSpan(
                                        //     children: <TextSpan>[
                                        //       TextSpan(
                                        //         text: "Material: ",
                                        //         style: TextStyle(
                                        //             color: Colors.black
                                        //                 .withOpacity(0.5),
                                        //             fontSize: 14),
                                        //       ),
                                        //       TextSpan(
                                        //         text: "Yes" + "\n",
                                        //         style: TextStyle(
                                        //             color: Colors.black
                                        //                 .withOpacity(0.8),
                                        //             fontSize: 14),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )
                                //Text(result["response"][index]["Name"]),
                              ),
                            );
                          }))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Functions   ",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  GridView.count(
                    crossAxisCount: 2,
                    //crossAxisSpacing: 10,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: (1 / 0.75),
                    shrinkWrap: true,
                    children: [

                    GestureDetector(child:
                      Padding(
                        padding: const EdgeInsets.only(right: 15,left: 15),
                        child: Container(
                          height: 150,
                          width: 130,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "images/create_bill_icon.png"),
                              ),
                              color: Color.fromARGB(217, 198, 194, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            textAlign: TextAlign.center,
                            "Create Bill",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Fifth(),
                        ),
                      );
                    },
                    ),

                      Padding(
                        padding: const EdgeInsets.only(right: 15,left: 15),
                        child: Container(
                          height: 150,
                          width: 130,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "images/employee_icon.png"),
                              ),
                              color: Color.fromARGB(217, 198, 194, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            textAlign: TextAlign.center,
                            "Employees",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15,left: 15),
                        child: Container(
                          height: 150,
                          width: 130,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "images/expenses_icon.png"),
                              ),
                              color: Color.fromARGB(217, 198, 194, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            textAlign: TextAlign.center,
                            "Expenses",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15,left: 15),
                        child: Container(
                          height: 150,
                          width: 130,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "images/receiving_icon.png"),
                              ),
                              color: Color.fromARGB(217, 198, 194, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            textAlign: TextAlign.center,
                            "Receiving",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),


                    ],
                    // children: List.generate(4, (index) {
                    //   return Padding(
                    //     padding: const EdgeInsets.only(right: 15,left: 15),
                    //     child: Container(
                    //       height: 150,
                    //       width: 130,
                    //       padding: EdgeInsets.all(6),
                    //       decoration: BoxDecoration(
                    //           image: DecorationImage(
                    //             image: AssetImage(
                    //                 "images/icons8-rent-96.png"),
                    //           ),
                    //           color: Color.fromARGB(176, 226, 221, 221),
                    //           borderRadius: BorderRadius.circular(20)),
                    //       child: Text(
                    //         textAlign: TextAlign.center,
                    //         "Sell Property",
                    //         style: TextStyle(
                    //           fontSize: 15,
                    //           color: Color.fromARGB(255, 0, 0, 0),
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // },),
                  ),
                  // SizedBox(
                  //   width: 340,
                  //   height: 65,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Color.fromARGB(210, 88, 40, 205),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => Fifth(),
                  //         ),
                  //       );
                  //     },
                  //     child: const Text(
                  //       "Create Bill",
                  //       style: TextStyle(color: Colors.white, fontSize: 20),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // SizedBox(
                  //   width: 340,
                  //   height: 65,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Color.fromARGB(210, 88, 40, 205),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const fifth(),
                  //         ),
                  //       );
                  //     },
                  //     child: const Text(
                  //       "Employees",
                  //       style: TextStyle(color: Colors.white, fontSize: 20),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // SizedBox(
                  //   width: 340,
                  //   height: 65,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Color.fromARGB(210, 88, 40, 205),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const fifth(),
                  //         ),
                  //       );
                  //     },
                  //     child: const Text(
                  //       "Expenses",
                  //       style: TextStyle(color: Colors.white, fontSize: 20),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // SizedBox(
                  //   width: 340,
                  //   height: 65,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Color.fromARGB(210, 88, 40, 205),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const fifth(),
                  //         ),
                  //       );
                  //     },
                  //     child: const Text(
                  //       "Recieving",
                  //       style: TextStyle(color: Colors.white, fontSize: 20),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        )),
      );
  }
}
