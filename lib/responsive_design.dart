library responsive_design;

import 'package:flutter/material.dart';

const kMaxColumns = 12;

enum Breakpoint {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
}

extension BreakpointExtension on Breakpoint {
  double get minActiveWidth {
    switch (this) {
      case Breakpoint.xs:
        return 575;
      case Breakpoint.sm:
        return 576;
      case Breakpoint.md:
        return 768;
      case Breakpoint.lg:
        return 992;
      case Breakpoint.xl:
        return 1200;
      case Breakpoint.xxl:
        return 1400;
      default:
        return 0;
    }
  }
}

class RValue<T> {
  final T? xs, sm, md, lg, xl, xxl;

  RValue({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });
}

class RDesignSpec {
  final double gutter;
  final EdgeInsetsGeometry padding, margin;
  final Set<Breakpoint> invisible;
  final RValue<Axis> axis;
  final RValue<int> spans;
  final bool singleChild;

  RDesignSpec({
    required this.gutter,
    required this.padding,
    required this.margin,
    required this.invisible,
    required this.axis,
    required this.spans,
    this.singleChild = false,
  });

  RDesignSpec copyWith({
    double? gutter,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Set<Breakpoint>? invisible,
    RValue<Axis>? axis,
    RValue<int>? spans,
    bool? singleChild,
  }) {
    return RDesignSpec(
      gutter: gutter ?? this.gutter,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      invisible: invisible ?? this.invisible,
      axis: axis ?? this.axis,
      spans: spans ?? this.spans,
      singleChild: singleChild ?? this.singleChild,
    );
  }
}

class RFlex {
  final RDesignSpec designSpec;
  final List<Widget> childrens;

  RFlex({
    required this.designSpec,
    this.childrens = const [],
  });

  factory RFlex.single({
    required RDesignSpec designSpec,
    required Widget child,
  }) =>
      RFlex(
        designSpec: designSpec.copyWith(singleChild: true),
        childrens: [child],
      );
}
