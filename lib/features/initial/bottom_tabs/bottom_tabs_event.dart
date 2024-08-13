part of 'bottom_tabs_bloc.dart';

@immutable
abstract class BottomTabsEvent {}

class ChangeTab extends BottomTabsEvent {
  final int index;

  ChangeTab({required this.index});
}
