library responsive_design;

import 'dart:math';

import 'package:flutter/material.dart';

const kMaxColumns = 12;

final _kEmptyBox = LimitedBox(
  maxWidth: 0.0,
  maxHeight: 0.0,
  child: ConstrainedBox(constraints: const BoxConstraints.expand()),
);

class RValue<T> {
  final T? xs, sm, md, lg, xl, xxl;

  const RValue({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  const RValue.all(T value)
      : xs = value,
        sm = value,
        md = value,
        lg = value,
        xl = value,
        xxl = value;

  const RValue.aboveXS(T value, {T? def})
      : sm = value,
        md = value,
        lg = value,
        xl = value,
        xxl = value,
        xs = def;

  const RValue.aboveSM(T value, {T? def})
      : sm = def,
        md = value,
        lg = value,
        xl = value,
        xxl = value,
        xs = def;

  const RValue.aboveMD(T value, {T? def})
      : sm = def,
        md = def,
        lg = value,
        xl = value,
        xxl = value,
        xs = def;

  const RValue.aboveLG(T value, {T? def})
      : sm = def,
        md = def,
        lg = def,
        xl = value,
        xxl = value,
        xs = def;

  const RValue.belowXL(T value, {T? def})
      : sm = value,
        md = value,
        lg = value,
        xl = def,
        xxl = def,
        xs = value;

  const RValue.belowLG(T value, {T? def})
      : sm = value,
        md = value,
        lg = def,
        xl = def,
        xxl = def,
        xs = value;

  const RValue.belowMD(T value, {T? def})
      : sm = value,
        md = def,
        lg = def,
        xl = def,
        xxl = def,
        xs = value;

  T? active(double length) {
    if (length >= 1400) return xxl;
    if (length >= 1200) return xl;
    if (length >= 992) return lg;
    if (length >= 768) return md;
    if (length >= 576) return sm;
    return xs;
  }
}

class RDesignSpec {
  final RValue<double> gutter;
  final RValue<EdgeInsetsGeometry> padding, margin;
  final RValue<bool> invisible;
  final RValue<Axis> axis;
  final RValue<int>? spans;
  final CrossAxisAlignment crossAxisAlignment;

  const RDesignSpec({
    required this.gutter,
    required this.padding,
    required this.margin,
    required this.invisible,
    required this.axis,
    required this.spans,
    required this.crossAxisAlignment,
  });

  RDesignSpec copyWith({
    RValue<double>? gutter,
    RValue<EdgeInsetsGeometry>? padding,
    RValue<EdgeInsetsGeometry>? margin,
    RValue<bool>? invisible,
    RValue<Axis>? axis,
    RValue<int>? spans,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    return RDesignSpec(
      gutter: gutter ?? this.gutter,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      invisible: invisible ?? this.invisible,
      axis: axis ?? this.axis,
      spans: spans ?? this.spans,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
    );
  }
}

class RFlex {
  final BoxDecoration? decoration;
  final RDesignSpec designSpec;
  final List<Widget> childrens;

  int? _diff;

  RFlex({
    required this.designSpec,
    this.decoration,
    this.childrens = const [],
  });

  List<double> spanToWidth(double length) {
    final _tempSpans = <int>[];
    final _tempWidths = <double>[];

    for (int i = 0; i < childrens.length; i++) {
      var item = childrens[i];
      if (item is RCol) {
        _tempSpans.add(item.spans?.active(length) ?? 1);
        continue;
      }
      _tempSpans.add(1);
    }

    final totalSpans = _tempSpans.reduce((a, b) => a + b);

    var spans = kMaxColumns;
    if (totalSpans < kMaxColumns) {
      _diff = kMaxColumns - totalSpans;
      _tempSpans.add(_diff!);
    } else {
      spans = max(kMaxColumns, totalSpans);

      if (_diff != null) _tempSpans.removeLast();

      _diff = null;
    }

    final singleSpanLength = length / spans;

    for (var span in _tempSpans) {
      final width = singleSpanLength * span;
      _tempWidths.add(width);
    }

    return _tempWidths;
  }

  Widget buildCol(BuildContext context) {
    final width = getSize(context).width;

    var _tempChildrens = childrens;

    final gutter = designSpec.gutter.active(width);
    if (gutter != null)
      _tempChildrens = [
        for (var i = 0; i < childrens.length; i++)
          Container(
            padding: (i != childrens.length - 1)
                ? EdgeInsets.only(bottom: gutter)
                : null,
            child: childrens[i],
          ),
      ];

    final child = Flex(
      direction: Axis.vertical,
      children: _tempChildrens,
    );

    return Container(
      padding: designSpec.padding.active(width),
      margin: designSpec.margin.active(width),
      decoration: decoration,
      child: child,
    );
  }

  Size getSize(BuildContext context) {
    final mq = MediaQuery.of(context);
    return mq.size;
  }

  Widget buildWithConstraints(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    final width = getSize(context).width;

    if (constraints.maxWidth.isInfinite) return buildFlex(width, width);
    return buildFlex(constraints.maxWidth, width);
  }

  Widget buildFlex(double length, double width) {
    final widths = spanToWidth(length);

    final count = _diff != null ? widths.length - 1 : widths.length;
    final gutter = designSpec.gutter.active(width) ?? 0;

    return Container(
      padding: designSpec.padding.active(width),
      margin: designSpec.margin.active(width),
      child: Flex(
        crossAxisAlignment: designSpec.crossAxisAlignment,
        verticalDirection: VerticalDirection.down,
        direction: designSpec.axis.active(width) ?? Axis.horizontal,
        clipBehavior: Clip.antiAlias,
        children: [
          for (int i = 0; i < count; i++)
            if (!(designSpec.invisible.active(width) ?? false))
              Container(
                padding:
                    (i != count - 1) ? EdgeInsets.only(right: gutter) : null,
                child: childrens[i],
                width: widths[i],
              ),
          if (_diff != null)
            RCol(
              spans: RValue.all(_diff!),
              children: [_kEmptyBox],
            ),
        ],
      ),
    );
  }
}

class RRow extends StatelessWidget {
  final bool nested;
  final RValue<double> gutter;
  final RValue<EdgeInsetsGeometry> padding, margin;
  final RValue<bool> invisible;
  final RValue<Axis> axis;
  final RValue<int>? spans;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  const RRow({
    Key? key,
    this.nested = false,
    this.gutter = const RValue.all(0.0),
    this.padding = const RValue.all(EdgeInsets.zero),
    this.margin = const RValue.all(EdgeInsets.zero),
    this.invisible = const RValue.all(false),
    this.axis = const RValue.all(Axis.horizontal),
    this.spans = const RValue.all(12),
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final designSpec = RDesignSpec(
      axis: axis,
      gutter: gutter,
      invisible: invisible,
      margin: margin,
      padding: padding,
      spans: spans,
      crossAxisAlignment: crossAxisAlignment,
    );

    final flex = RFlex(designSpec: designSpec, childrens: children);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return flex.buildWithConstraints(context, constraints);
      },
    );
  }
}

class RCol extends StatelessWidget {
  final BoxDecoration? decoration;
  final RValue<double> gutter;
  final RValue<EdgeInsetsGeometry> padding, margin;
  final RValue<bool> invisible;
  final RValue<int>? spans;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  const RCol({
    Key? key,
    this.decoration,
    this.gutter = const RValue.all(0.0),
    this.padding = const RValue.all(EdgeInsets.zero),
    this.margin = const RValue.all(EdgeInsets.zero),
    this.invisible = const RValue.all(false),
    this.spans = const RValue.all(1),
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final designSpec = RDesignSpec(
      axis: const RValue.all(Axis.vertical),
      gutter: gutter,
      invisible: invisible,
      margin: margin,
      padding: padding,
      spans: spans,
      crossAxisAlignment: crossAxisAlignment,
    );

    final flex = RFlex(
      designSpec: designSpec,
      childrens: children,
      decoration: decoration,
    );

    return flex.buildCol(context);
  }
}
