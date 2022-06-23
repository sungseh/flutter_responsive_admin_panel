part of 'page_bloc.dart';
 
 
abstract class PageState extends Equatable {
  const PageState();
}

class PageInitialState extends PageState {
  @override
  List<Object> get props => [];
}

class PageLoadedState extends PageState{
  final int number;
  const PageLoadedState(this.number);

  @override
  List<Object?> get props => [number];
}

class PageNameLoadedState extends PageState{
  final String pageName;

  const PageNameLoadedState(this.pageName);

  @override
  List<Object?> get props => [pageName];
}

 
