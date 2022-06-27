import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'scroll_state.dart';

class ScrollCubit extends Cubit<ScrollState> {
  ScrollCubit() : super(const ScrollState());

  initScroll(double appBarHeight, double toolbarHeight) {
    emit(state.copyWith(
        appBarHeight: appBarHeight, toolbarHeight: toolbarHeight));
  }

  updateOffset(double offset) {
    emit(state.copyWith(offset: offset));
  }
}
