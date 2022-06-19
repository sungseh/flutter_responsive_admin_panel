part of 'presenters_bloc.dart';

abstract class PresentersEvent extends Equatable {
  const PresentersEvent();

  @override
  List<Object> get props => [];
}
  
class LoadPresenters extends PresentersEvent { 
  const LoadPresenters();

  @override
  List<Object> get props => [];
}

class UpdatePresenters extends PresentersEvent { 
  final List<PresenterModel?>? presenters; 

  const UpdatePresenters(this.presenters);

  @override
  List<Object> get props => [presenters!]; 
}
