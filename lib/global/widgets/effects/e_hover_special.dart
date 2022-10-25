import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cursor/cursor_cubit.dart';


class EHoverSpecial extends StatefulWidget {
  final Widget? child;
  final BoxDecoration? decoration;

  const EHoverSpecial({super.key, this.child, this.decoration});

  @override
  State<EHoverSpecial> createState() => _EHoverSpecialState();
}

class _EHoverSpecialState extends State<EHoverSpecial> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final CursorCubit cubit = context.read<CursorCubit>();

    return MouseRegion(
      key: _key,
      opaque: false,
      onHover: (event) => cubit.changeCursor(_key, decoration: widget.decoration),
      onExit: (event) => cubit.resetCursor(),
      child: widget.child,
    );
  }
}