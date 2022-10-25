import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portfolio/global/blocs/cursor/cursor_cubit.dart';
import 'package:provider/provider.dart';
import 'package:bloc/bloc.dart';

class EAnimatedCursorScreen extends StatelessWidget {
  final Widget? child;

  const EAnimatedCursorScreen({super.key, this.child});

  void _onCursorUpdate(PointerEvent event, BuildContext context) {
    context.read<CursorCubit>().updateCursorPosition(event.position);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();

    return BlocProvider(
      create: (context) => CursorCubit(),
      child: BlocBuilder<CursorCubit, CursorState>(
        //child: child,
        builder: (context, stateP) {
          //final CursorState stateParent = provider;

          final state = (stateP as CursorInitialState);

          return Stack(
            children: [
              if (child != null) child!,
              Positioned.fill(
                child: MouseRegion(
                  opaque: false,
                  onExit: (event) => context.read<CursorCubit>().resetCursor(),
                  onHover: (event) => _onCursorUpdate(event, context),
                ),
              ),
              Visibility(
                visible: state.offset != Offset.zero,
                child: AnimatedPositioned(
                  duration: const Duration(milliseconds: 50),
                  top: state.offset.dy - state.size.height / 2,
                  left: state.offset.dx - state.size.width / 2,
                  width: state.size.width,
                  height: state.size.height,
                  child: IgnorePointer(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutExpo,
                      width: state.size.width,
                      height: state.size.height,
                      decoration: state.decoration,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
