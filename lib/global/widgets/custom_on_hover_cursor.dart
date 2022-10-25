import 'package:flutter/material.dart';

class CustomOnHoverCursor extends StatefulWidget {
  final Widget child;
  //final MouseCursor cursorType;

  const CustomOnHoverCursor({super.key, required this.child, /*required this.cursorType*/});

  @override
  State<CustomOnHoverCursor> createState() => _CustomOnHoverButtonState();
}

class _CustomOnHoverButtonState extends State<CustomOnHoverCursor> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    //final hoveredTransform = Matrix4.identity()..translate(0, -8, 0); //Move upper side (north)
    //final hoveredTransform = Matrix4.identity()..translate(12, -8, 0); //Move diagonal right (northest)
    final hoveredTransform = Matrix4.identity()..scale(1.1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
