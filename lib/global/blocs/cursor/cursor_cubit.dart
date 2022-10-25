import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'cursor_state.dart';

class CursorCubit extends Cubit<CursorState> {
  CursorCubit() : super(CursorInitialState());

  void resetCursor() {
    emit(CursorInitialState());
  }

  void updateCursorPosition(Offset pos) {
    emit(CursorInitialState(offset: pos));
  }

  void changeCursor(GlobalKey key, {BoxDecoration? decoration}) {
    final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) return;

    emit(CursorInitialState(
        //decoration: decoration ?? CursorInitialState.kDefaultDecoration,
        decoration: decoration ?? const BoxDecoration(),
        size: renderBox.size,
        offset: renderBox
            .localToGlobal(Offset.zero)
            .translate(renderBox.size.width / 2, renderBox.size.height / 2)));
  }
}
