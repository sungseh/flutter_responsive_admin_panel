part of 'presenters_bloc.dart';

abstract class PresentersEvent extends Equatable {
  const PresentersEvent();

  @override
  List<Object> get props => [];
}

class RefreshPresentersEvent extends PresentersEvent {
  const RefreshPresentersEvent();

  @override
  List<Object> get props => [];
}
  
class LoadPresentersEvent extends PresentersEvent { 
  const LoadPresentersEvent();

  @override
  List<Object> get props => [];
}

class UpdatePresentersEvent extends PresentersEvent { 
  final List<PresenterModel?>? presenters; 

  const UpdatePresentersEvent(this.presenters);

  @override
  List<Object> get props => [presenters!]; 
}
