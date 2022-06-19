part of 'presenters_bloc.dart';

abstract class PresentersState extends Equatable {
  const PresentersState();
  
  @override
  List<Object> get props => [];
}

class PresentersInitial extends PresentersState {}

class PresentersLoading extends PresentersState {
  @override
  List<Object> get props => [];
}

class PresentersLoaded extends PresentersState {  
  final List<PresenterModel?>? presenters; 

  const PresentersLoaded({this.presenters});

  @override
  List<Object> get props => [presenters!];

  @override
  String toString() => 'PresentersLoaded  {presenters: $presenters}';
}
 
class PresentersNotLoaded extends PresentersState {
  @override
  List<Object> get props => [];
}

class PresentersIsEmpty extends PresentersState {
  @override
  List<Object> get props => [];
}
