part of 'test_bloc.dart';

// abstract class TestEvent extends Equatable {
//   const TestEvent();

//   @override
//   List<Object> get props => [];
// }

abstract class TestEvent extends Equatable {
  const TestEvent();
}

class InitTestEvent extends TestEvent {
  @override 
  List<Object?> get props => [];
}


class LoadTestEvent extends TestEvent{
  final int number;

  const LoadTestEvent(this.number);

  @override
  List<Object?> get props => [number];
}