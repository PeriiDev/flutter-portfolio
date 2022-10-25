part of 'cursor_cubit.dart';

@immutable
abstract class CursorState {}

class CursorInitialState extends CursorState {
  final BoxDecoration decoration;
  final Size size;
  final Offset offset;

  static const BoxDecoration kDefaultDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(90)),
    //color: Colors.white60,
    border: Border.symmetric(
      horizontal: BorderSide(color: Colors.white, width: 2),
      vertical: BorderSide(color: Colors.white, width: 2),
    ),
  );
  static const Size kDefaultSize = Size(30, 30);

  CursorInitialState({
    this.decoration = kDefaultDecoration,
    this.size = kDefaultSize,
    this.offset = Offset.zero,
  });
}
