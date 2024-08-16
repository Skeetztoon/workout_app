part of 'bottom_tabs_bloc.dart';

abstract class BottomTabsState {
  final int tabIndex;

  BottomTabsState({required this.tabIndex});
}

final class BottomTabsInitial extends BottomTabsState {
  BottomTabsInitial({required super.tabIndex});

}
