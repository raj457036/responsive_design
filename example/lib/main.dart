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
        title: Text("Hello"),
      ),
      body: Center(
        child: RCol(
          gutter: RValue.all(5),
          children: [
            RRow(
              gutter: RValue.all(5),
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RCol(
                  decoration: BoxDecoration(color: Colors.red),
                  padding: RValue.all(EdgeInsets.all(20.0)),
                  spans: RValue(xs: 6, sm: 8, md: 6, lg: 4, xl: 2, xxl: 1),
                  children: [
                    Text("Hello"),
                  ],
                ),
                RCol(
                  decoration: BoxDecoration(color: Colors.purple),
                  padding: RValue.all(EdgeInsets.all(20.0)),
                  spans: RValue(xs: 3, sm: 2, md: 4, lg: 2, xl: 1, xxl: 1),
                  children: [
                    Text("Hello"),
                  ],
                ),
                RCol(
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  padding: RValue.all(EdgeInsets.all(20.0)),
                  spans: RValue(xs: 3, sm: 2, md: 2, lg: 6, xl: 9, xxl: 4),
                  children: [
                    Text("Hello"),
                  ],
                ),
              ],
            ),
            RRow(
              gutter: RValue.all(5),
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RCol(
                  decoration: BoxDecoration(color: Colors.red),
                  spans: RValue(xs: 3, sm: 2, md: 4, lg: 2, xl: 1, xxl: 1),
                  padding: RValue.all(EdgeInsets.all(20.0)),
                  children: [
                    Text("Hello"),
                  ],
                ),
                RCol(
                  decoration: BoxDecoration(color: Colors.purple),
                  padding: RValue.all(EdgeInsets.all(20.0)),
                  spans: RValue(xs: 3, sm: 2, md: 2, lg: 6, xl: 9, xxl: 4),
                  children: [
                    Text("Hello"),
                  ],
                ),
                RCol(
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  padding: RValue.all(EdgeInsets.all(20.0)),
                  spans: RValue(xs: 6, sm: 8, md: 6, lg: 4, xl: 2, xxl: 1),
                  children: [
                    Text("Hello"),
                  ],
                ),
              ],
            ),
            RRow(
              gutter: RValue.all(5),
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RCol(
                  decoration: BoxDecoration(color: Colors.red),
                  padding: RValue.all(EdgeInsets.all(20.0)),
                  spans: RValue(xs: 6, sm: 8, md: 6, lg: 4, xl: 2, xxl: 1),
                  children: [
                    Text("Hello"),
                  ],
                ),
                RCol(
                  decoration: BoxDecoration(color: Colors.purple),
                  padding: RValue.all(EdgeInsets.all(20.0)),
                  spans: RValue(xs: 3, sm: 2, md: 4, lg: 2, xl: 1, xxl: 1),
                  children: [
                    Text("Hello"),
                  ],
                ),
                RCol(
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  padding: RValue.all(EdgeInsets.all(20.0)),
                  spans: RValue(xs: 3, sm: 2, md: 2, lg: 6, xl: 9, xxl: 4),
                  children: [
                    Text("Hello"),
                  ],
                ),
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
