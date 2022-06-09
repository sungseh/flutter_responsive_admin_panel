import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'test_event.dart';
part 'test_state.dart';

// class TestBloc extends Bloc<TestEvent, TestState> {
//   TestBloc() : super(TestInitial()) {
//     on<TestEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }


class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<LoadTestEvent>((event, emit) {
      if (event is LoadTestEvent){
        emit(TestLoadedState(event.number + 1));
      }
    });
  }
}