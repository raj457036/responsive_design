import 'dart:html';

import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: Center(
        child: RRow(
          children: [
            RCol(
              spans: RValue.all(8),
              decoration: BoxDecoration(color: Colors.deepOrange),
              children: [
                RRow(
                  gutter: RValue.all(10),
                  nested: true,
                  children: [
                    RCol(
                      gutter: RValue.all(5),
                      decoration: BoxDecoration(color: Colors.red),
                      spans: RValue(xxl: 5, xl: 6, md: 3, sm: 2),
                      children: [
                        Text("R1 C1 E1"),
                        Text("R1 C1 E2"),
                      ],
                    ),
                    RCol(
                      decoration: BoxDecoration(color: Colors.green),
                      children: [
                        Text("R1 C2 E1"),
                        Text("R1 C2 E2"),
                      ],
                    ),
                    RCol(
                      decoration: BoxDecoration(color: Colors.blue),
                      children: [
                        Text("R1 C3 E1"),
                        Text("R1 C3 E2"),
                      ],
                    ),
                  ],
                ),
                RRow(
                  children: [
                    RCol(
                      decoration: BoxDecoration(color: Colors.lightGreen),
                      spans: RValue(xxl: 3, xl: 6, md: 1),
                      children: [
                        Text("R2 C1 E1"),
                        Text("R2 C1 E2"),
                      ],
                    ),
                    RCol(
                      spans: RValue(xxl: 2, xl: 3, md: 2),
                      decoration: BoxDecoration(color: Colors.grey),
                      children: [
                        Text("R2 C2 E1"),
                        Text("R2 C2 E2"),
                      ],
                    ),
                    RCol(
                      spans: RValue(xxl: 3, md: 9),
                      decoration: BoxDecoration(color: Colors.purple),
                      children: [
                        Text("R2 C3 E1"),
                        Text("R2 C3 E2"),
                        RRow(
                          gutter: RValue.all(5),
                          invisible: RValue.belowXL(true),
                          nested: true,
                          children: [
                            RCol(
                              decoration:
                                  BoxDecoration(color: Colors.lightGreen),
                              spans: RValue.aboveMD(6, def: 3),
                              children: [
                                Text("R2 C1 E1"),
                                Text("R2 C1 E2"),
                              ],
                            ),
                            RCol(
                              gutter: RValue.all(5),
                              spans: RValue.aboveMD(3, def: 6),
                              decoration: BoxDecoration(color: Colors.grey),
                              children: [
                                Text("R2 C2 E1"),
                                Text("R2 C2 E2"),
                                SizedBox(
                                  height: 50,
                                  child: ListView(
                                    children: [
                                      Text("R2 C2 E1"),
                                      Text("R2 C2 E1"),
                                      Text("R2 C2 E1"),
                                      Text("R2 C2 E1"),
                                      Text("R2 C2 E1"),
                                      Text("R2 C2 E1"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
