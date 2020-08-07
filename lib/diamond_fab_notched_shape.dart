import 'package:flutter/material.dart';

/// As with the normal [FloatingActionButton] the [DiamondNotchedFab] also will include
/// a notch inn the [BottomAppBar] if there is one and the [FloatingActionButtonLocation]
/// is docked.  In this case, the edges of the notch are a triangle or Rhombus
/// rather then a circle.

class DiamondFabNotchedShape extends NotchedShape {
  /// Creates a border radius where all radii are [Radius.circular(radius)].
  /// Defaults to 16.0
  final double borderRadius;

  DiamondFabNotchedShape({
    Key key,
    this.borderRadius: 16.0,
  });

  @override
  Path getOuterPath(Rect host, Rect guest) {
    final Rect fabMargin = guest.inflate(12);
    double radius = 10;
    final Rect intersection = fabMargin.intersect(host);
    final double notchCenter = intersection.height *
        (fabMargin.height / 2.0) /
        (fabMargin.width / 2.0);

    Path path = Path();
    path.moveTo(host.left, host.top);
    if (borderRadius == null || borderRadius == 0) {
      path.lineTo(fabMargin.center.dx - notchCenter, host.top);
      path.lineTo(fabMargin.left + fabMargin.width / 2.0, fabMargin.bottom);
      path.lineTo(fabMargin.center.dx + notchCenter, host.top);
    } else {
      path.lineTo(fabMargin.center.dx - notchCenter - radius, host.top);
      path.arcToPoint(
        Offset(fabMargin.center.dx - notchCenter + radius, host.top + radius),
        radius: Radius.circular(borderRadius * 2),
      );
      path.lineTo(fabMargin.left + fabMargin.width / 2.0 - radius,
          fabMargin.bottom - radius);
      path.arcToPoint(
          Offset(fabMargin.left + fabMargin.width / 2.0 + radius,
              fabMargin.bottom - radius),
          radius: Radius.circular(borderRadius),
          clockwise: false);
      path.lineTo(
          fabMargin.center.dx + notchCenter - radius, host.top + radius);
      path.lineTo(
          fabMargin.center.dx + notchCenter - radius, host.top + radius);
      path.arcToPoint(
        Offset(fabMargin.center.dx + notchCenter + radius, host.top),
        radius: Radius.circular(borderRadius * 2),
      );
    }

    path.lineTo(host.right, host.top);
    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);
    path.close();

    return path;
  }
}
