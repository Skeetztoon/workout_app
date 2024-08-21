import 'package:flutter_bloc/flutter_bloc.dart';

class StopwatchCubit extends Cubit<String> {
  StopwatchCubit() : super('');

  void changeValue(String value) => emit(value);
}
