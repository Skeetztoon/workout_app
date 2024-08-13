import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_tabs_event.dart';
part 'bottom_tabs_state.dart';

class BottomTabsBloc extends Bloc<BottomTabsEvent, BottomTabsState> {
  BottomTabsBloc() : super(BottomTabsInitial(tabIndex: 0)) {
    on<BottomTabsEvent>((event, emit) {
      if (event is ChangeTab) {
        emit(BottomTabsInitial(tabIndex: event.index));
      }
    });
  }
}
