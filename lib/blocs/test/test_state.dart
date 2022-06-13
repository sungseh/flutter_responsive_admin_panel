part of 'test_bloc.dart';
 
abstract class TestState extends Equatable {
  const TestState();
}

class TestInitial extends TestState {
  @override
  List<Object> get props => [];
}

class TestLoadedState extends TestState{
  final int number;
  TestLoadedState(this.number);

  @override
  List<Object?> get props => [number];
}