import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<bool> {
  LocaleCubit() : super(false);

  void changeLocale() {
    final currentState = state;
    final oppositeState = !currentState;
    emit(oppositeState);
  }
}
