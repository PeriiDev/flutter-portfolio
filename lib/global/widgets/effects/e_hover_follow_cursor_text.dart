import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class EHoverFollowCursorText extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const EHoverFollowCursorText({
    super.key,
    required this.builder,
  });

  @override
  State<EHoverFollowCursorText> createState() => _EHoverFollowCursorTextState();
}

class _EHoverFollowCursorTextState extends State<EHoverFollowCursorText> {
  bool isHovered = false;

  double localX = 0;
  double localY = 0;
  bool defaultPosition = true;

  //bool downButton = false;
  // double scaleX = 1;
  // double scaleY = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double percentageX = (localX / (size.width * 0.45) / 2) * 100;
    double percentageY = (localY / ((size.height / 2) + 70) / 1.5) * 100;

    final hoveredTransform = Matrix4.identity()
      ..translate((70 * (percentageX / 40) + -25), (70 * (percentageY / 15) - 50), 0)
      ..scale(1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      onHover: (details) {
        if (mounted) setState(() => defaultPosition = false);
        if (details.localPosition.dx > 0 && details.localPosition.dy > 0) {
          if (details.localPosition.dx < (size.width * 0.45) * 1.5 && details.localPosition.dy > 0) {
            localX = details.localPosition.dx;
            localY = details.localPosition.dy;
          }
        }
      },
      child: AnimatedContainer(
        //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        //width: 200,
        //height: 150,
        curve: Sprung.overDamped,
        duration: const Duration(milliseconds: 300),
        transform: transform,
        alignment: FractionalOffset.center,
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
