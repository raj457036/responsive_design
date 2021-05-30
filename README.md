# responsive_design

Easiest Set of widgets to build responsive apps with 12 Column Grid System in flutter.

## Getting Started

Just use **RRow** and **RCol** insted of **Row** and **Column**

### Example

```dart
RCol(
    gutter: RValue.all(5),
    children: [
    RRow(
        gutter: RValue.all(5),
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
            RCol(
                decoration: BoxDecoration(color: Colors.red),
                padding: RValue.belowLG(EdgeInsets.all(20.0)),
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
```


This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
