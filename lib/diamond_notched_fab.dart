library diamond_notched_fab;

import 'dart:math' as math;

import 'package:flutter/material.dart';

class _DefaultHeroTag {
  const _DefaultHeroTag();

  @override
  String toString() => '<default FloatingActionButton tag>';
}

/// A material design diamond shaped floating action button.
///
/// Unlike the basic floating action button, this button is diamond shaped by default.
///
/// Use a single floating action button per screen. Floating action
/// buttons are used for primary and positive actions.
///
/// if [onPressed] is null, then button will be disabled and will
/// not react to touch.
///
/// As with the normal [FloatingActionButton] the [DiamondNotchedFab] also will include
/// a notch inn the [BottomAppBar] if there is one and the [FloatingActionButtonLocation]
/// is docked.  In this case, the edges of the notch are a triangle or Rhombus
/// rather then a circle.
/// See also:
///
/// * [Scaffold]
/// * [FloatingActionButton]
/// * [FloatingActionButtonLocation]
class DiamondNotchedFab extends StatefulWidget {
  /// The widget that is below this widget on the tree.
  ///
  /// Ussually an [Icon]
  final Widget child;

  /// The margin of the notch around the floating action button
  ///
  /// The larger this margin, the less triangular the notch will become
  /// and the larger the shape.
  ///
  /// Must be in a docked position to show the notch.  Either [centerDocked]
  /// or [endDocked] and must have a [BottomAppBar] present in the [Scaffold].
  /// Defaults to 8.0.
  final double notchMargin;

  /// The color to use when filling the button.
  ///
  /// Defaults to [ThemeData.accentColor] for the current theme.
  final Color backgroundColor;

  /// The default icon and text color.
  ///
  /// Defaults to [ThemeData.accentIconTheme.color] for the current theme.
  final Color foregroundColor;

  /// The z-coordinate at which to place this button. This controls the size of
  /// the shadow below the floating action button.
  ///
  /// Defaults to 6.0, based on the Material Design Spec.
  final double elevation;

  /// Text that will describe the action that happens [onPressed]
  ///
  /// This text is displayed to the user when they long press the
  /// floating action button.  It is used for accessability.
  final String tooltip;

  /// The callback function that is called when the button is tapped.
  ///
  /// If set to null, the button will be disabled.
  final VoidCallback onPressed;

  /// A tag for the button's [Hero] widget.
  ///
  /// Defaults to a tag that matches a normal FAB
  ///
  /// set this to null if you don't want the button to
  /// have a hero tag.
  ///
  /// If not set to a unique value, then you may only have one single
  /// [DiamondFab] or [FloatingActionButton] per route or screen.
  /// Multiple hero tags will cause a tag conflict.
  final Object heroTag;

  /// The z-coordinate at which to place this button when the user is touching
  /// the button. This controls the size of the shadow below the floating action
  /// button.
  ///
  /// Defaults to 12.0 which is based on the Material Design spec
  final double highlightElevation;

  /// Controls the size of this button.
  ///
  /// By default, floating action buttons are non-mini and have a height and
  /// width of 68.0 pixels. Mini floating action buttons have a height
  /// and width of 52.0 pixels.
  final bool mini;

  /// Creates a border radius where all radii are [Radius.circular(radius)].
  /// Defaults to 12.0
  final double borderRadius;

  DiamondNotchedFab({
    Key key,
    this.child,
    this.notchMargin: 8.0,
    this.backgroundColor,
    @required this.onPressed,
    this.foregroundColor,
    this.tooltip,
    this.heroTag: const _DefaultHeroTag(),
    this.highlightElevation: 12.0,
    this.mini: false,
    this.elevation: 6.0,
    this.borderRadius: 12.0,
  })  : assert(elevation != null),
        assert(highlightElevation != null),
        assert(mini != null),
        assert(notchMargin != null),
        super(key: key);

  @override
  _DiamondNotchedFabState createState() => _DiamondNotchedFabState();
}

class _DiamondNotchedFabState extends State<DiamondNotchedFab> {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 4,
      child: FloatingActionButton(
        elevation: widget.elevation,
        highlightElevation: widget.highlightElevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius)),
        backgroundColor: widget.backgroundColor,
        foregroundColor: widget.foregroundColor,
        child: Transform.rotate(
          angle: math.pi / 4,
          child: widget.child,
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}