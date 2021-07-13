import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Design',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Design"),
      ),
      body: RCol(
        gutter: RValue.all(5),
        children: [
          RRow(
            gutter: RValue.all(5),
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RCol(
                invisible: RValue.belowLG(true),
                decoration: BoxDecoration(color: Colors.pink),
                padding: RValue.all(EdgeInsets.all(20.0)),
                spans: RValue(xs: 6, sm: 6, md: 6, lg: 4, xl: 2, xxl: 1),
                children: [
                  Text("Hello"),
                ],
              ),
              RCol(
                invisible: RValue.aboveMD(true),
                decoration: BoxDecoration(color: Colors.blue),
                padding: RValue.all(EdgeInsets.all(20.0)),
                spans: RValue(xs: 6, sm: 6, md: 6, lg: 4, xl: 2, xxl: 1),
                children: [
                  Text("Hello 2"),
                ],
              ),
              RCol(
                decoration: BoxDecoration(color: Colors.purple),
                padding: RValue.all(EdgeInsets.all(20.0)),
                spans: RValue(xs: 3, sm: 3, md: 4, lg: 2, xl: 1, xxl: 1),
                children: [
                  Text("Hello"),
                ],
              ),
              RCol(
                decoration: BoxDecoration(color: Colors.lightGreen),
                padding: RValue.all(EdgeInsets.all(20.0)),
                spans: RValue(xs: 3, sm: 3, md: 2, lg: 6, xl: 9, xxl: 4),
                children: [
                  Text("Hello"),
                ],
              ),
            ],
          ),
          RRow(
            gutter: RValue.all(5),
            crossAxisAlignment: CrossAxisAlignment.end,
            axis: RValue(xs: Axis.vertical),
            children: [
              RCol(
                decoration: BoxDecoration(color: Colors.red),
                spans: RValue(xs: 12, sm: 2, md: 4, lg: 2, xl: 1, xxl: 1),
                padding: RValue.all(EdgeInsets.all(20.0)),
                children: [
                  Text("Hello"),
                ],
              ),
              RCol(
                decoration: BoxDecoration(color: Colors.purple),
                padding: RValue.all(EdgeInsets.all(20.0)),
                spans: RValue(xs: 6, sm: 2, md: 2, lg: 6, xl: 9, xxl: 4),
                children: [
                  Text("Hello"),
                ],
              ),
              RCol(
                decoration: BoxDecoration(color: Colors.lightGreen),
                padding: RValue.all(EdgeInsets.all(20.0)),
                spans: RValue(xs: 8, sm: 8, md: 6, lg: 4, xl: 2, xxl: 1),
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
                invisible: RValue.all(true),
                decoration: BoxDecoration(color: Colors.purple),
                padding: RValue.all(EdgeInsets.all(20.0)),
                spans: RValue(xs: 3, sm: 2, md: 4, lg: 2, xl: 1, xxl: 1),
                children: [
                  Text("Hello 2"),
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
    );
  }
}
