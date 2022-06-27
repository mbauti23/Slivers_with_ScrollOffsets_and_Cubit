part of 'scroll_cubit.dart';

class ScrollState extends Equatable {
  const ScrollState(
      {this.offset = 0, this.toolbarHeight = 50, this.appBarHeight = 200});

  final double offset;
  final double toolbarHeight;
  final double appBarHeight;
  bool get isAppBarCollapsed => offset >= appBarHeight - toolbarHeight;

  // Returns a double [n] where 0 <= n <= 1
  // 0 is fully expanded, 1 is fully collapsed
  double progressToCollapse() {
    return offset <= 0
        ? 0
        : offset > (appBarHeight - 50)
            ? 1
            : offset / (appBarHeight - 50);
  }

  ScrollState copyWith(
      {double? offset, double? toolbarHeight, double? appBarHeight}) {
    return ScrollState(
        offset: offset ?? this.offset,
        toolbarHeight: toolbarHeight ?? this.toolbarHeight,
        appBarHeight: appBarHeight ?? this.appBarHeight);
  }

  @override
  List<Object> get props =>
      [offset, isAppBarCollapsed, toolbarHeight, appBarHeight];
}
