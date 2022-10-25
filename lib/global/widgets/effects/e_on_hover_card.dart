import 'package:flutter/material.dart';

class EOnHoverCard extends StatefulWidget {
  //final Widget child;
  final Widget Function(bool isHovered) builder;

  const EOnHoverCard({
    super.key,
    //required this.child,
    required this.builder,
  });

  @override
  State<EOnHoverCard> createState() => _CustomOnHoverButtonState();
}

class _CustomOnHoverButtonState extends State<EOnHoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    //final hoveredTransform = Matrix4.identity()..translate(0, -8, 0); //Move upper side (north)
    //final hoveredTransform = Matrix4.identity()..translate(12, -8, 0); //Move diagonal right (northest)
    final hoveredTransform = Matrix4.identity()..translate(0, -16, 0);
    //final transform = isHovered ? hoveredTransform : Matrix4.identity();
    final transform = Matrix4.identity();

    return MouseRegion(
      //cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
