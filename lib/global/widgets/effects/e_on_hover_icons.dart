import 'package:flutter/material.dart';

class EOnHoverIcons extends StatefulWidget {
  //final Widget child;
  final Widget Function(bool isHovered) builder;

  const EOnHoverIcons({
    super.key,
    //required this.child,
    required this.builder,
  });

  @override
  State<EOnHoverIcons> createState() => _CustomOnHoverButtonState();
}

class _CustomOnHoverButtonState extends State<EOnHoverIcons> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -16, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        curve: Curves.bounceOut,
        duration: const Duration(milliseconds: 400),
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
