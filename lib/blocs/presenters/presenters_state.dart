part of 'presenters_bloc.dart';

abstract class PresentersState extends Equatable {
  // final bool? hasReachedLimit;
  // const PresentersState({
  //   this.hasReachedLimit
  // });
  // @override
  // List<Object> get props => [hasReachedLimit!];


  const PresentersState();
  
  @override
  List<Object> get props => [];
}

class PresentersInitialState extends PresentersState {}

class PresentersLoadingState extends PresentersState {
  @override
  List<Object> get props => [];
}

class PresentersLoadedState extends PresentersState {  
  final List<PresenterModel?>? presenters; 
  final bool? hasReachedLimit;

  const PresentersLoadedState({
    this.hasReachedLimit = false, 
    this.presenters
  });

  @override
  List<Object> get props => [presenters!, hasReachedLimit!];

  @override
  // String toString() => 'PresentersLoadedState  {presenters: $presenters} HasReachedLiimit {limit: $hasReachedLimit}';
  String toString() => 'PresentersLoadedState';
}
 
class PresentersNotLoadedState extends PresentersState {
  @override
  List<Object> get props => [];
}

class PresentersIsEmptyState extends PresentersState {
  @override
  List<Object> get props => [];
}
