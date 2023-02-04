import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CreateBillInvoice extends StatefulWidget {
  const CreateBillInvoice({Key? key}) : super(key: key);

  @override
  State<CreateBillInvoice> createState() => _CreateBillInvoiceState();
}

class _CreateBillInvoiceState extends State<CreateBillInvoice> {
  Box? box1;
  Map<String, Map> titleMap = {};
  Map<String, Map> finalMap = {};
  List<Table> list = [];

  late final myMap = {};
  @override
  void initState() {
    createBox();
    print("final map");
    print(titleMap);
  }

  void createBox() async {
    box1 = await Hive.openBox('bill');
    print(" ==========");
    setState(() {
      titleMap = box1?.get("billvalue");
      print(titleMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(titleMap);
    return Scaffold(
      //background color of scaffold
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Invoice'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: new ListView.builder(
                shrinkWrap: true,
                itemCount: titleMap.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = titleMap.keys.elementAt(index);
                  print(titleMap);
                  print("hello");
                  print(key);
                  print(titleMap[key].toString());

                  return new ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 700, minHeight: 56.0),
                    child: Column(
                      children: [
                        new Flexible(
                          child: Row(
                            children: [
                              Flexible(
                                  child: ListTile(
                                title: Text('${key}'),
                              )),
                              Flexible(
                                  child: ListTile(
                                title: Text('Unit'),
                              )),
                              Flexible(
                                  child: ListTile(
                                title: Text('NOS'),
                              )),
                              Flexible(
                                  child: ListTile(
                                title: Text('QTY'),
                              ))
                            ],
                          ),
                        ),
                        new Expanded(
                          child: new ListView.builder(
                            shrinkWrap: true,
                            itemCount: titleMap[key]?.length,
                            itemBuilder: (BuildContext context, int index1) {
                              Map<dynamic, dynamic>? descMap = titleMap[key];
                              String key1 =
                                  titleMap[key]?.keys.elementAt(index1);
                              print("val");
                              print(key1);
                              print(descMap);
                              print(
                                descMap?[key1],
                              );
                              print("valuesat");
                              print(
                                descMap?[key1][0],
                              );
                              print(
                                descMap?[key1][1][0],
                              );
                              print(
                                descMap?[key1][2][0],
                              );
                              print(
                                descMap?[key1][3][0],
                              );

                              return new SizedBox(
                                height: 400,
                                child: Column(
                                  children: [
                                    new Flexible(
                                      child: ListTile(
                                        title: Text(
                                          descMap?[key1][0],
                                        ),
                                      ),
                                    ),
                                    new Expanded(
                                      child: ListView.builder(
                                        itemCount: descMap?[key1][1]?.length,
                                        itemBuilder:
                                            (BuildContext context, int i) {
                                          return new SizedBox(
                                            width: 20,
                                            child: Row(
                                              children: [
                                                new Flexible(
                                                  child: Card(
                                                    child: ListTile(
                                                      title: Text(
                                                        descMap?[key1][1][i],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          new Flexible(
                                                            child: Card(
                                                              child: ListTile(
                                                                title: Text(
                                                                  descMap?[key1]
                                                                      [2][i],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          new Flexible(
                                                            child: Card(
                                                              child: ListTile(
                                                                title: Text(
                                                                  descMap?[key1]
                                                                      [3][i],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          new Flexible(
                                                            child: Card(
                                                              child: ListTile(
                                                                title: Text(
                                                                  descMap?[key1]
                                                                      [4][i],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          new Flexible(
                                                            child: Card(
                                                              child: ListTile(
                                                                title: Text(
                                                                  descMap?[key1]
                                                                      [2][i],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          new Flexible(
                                                            child: Card(
                                                              child: ListTile(
                                                                title: Text(
                                                                  descMap?[key1]
                                                                      [3][i],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          new Flexible(
                                                            child: Card(
                                                              child: ListTile(
                                                                title: Text(
                                                                  descMap?[key1]
                                                                      [5][i],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
