import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/app_state.dart';

import 'app_event.dart';

class AppBlocs extends Bloc<AppEvents, AppState> {
  AppBlocs() : super(InitStates()) {
    on<Increment>(
      (event, emit) {
        emit(AppState(counter: state.counter + 1));
        print(state.counter);
      },
    );
    on<Decrement>(
      (event, emit) => {
        print(state.counter),
        emit(AppState(counter: state.counter - 1)),
      },
    );
  }
}
