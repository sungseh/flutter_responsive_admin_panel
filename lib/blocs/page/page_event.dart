part of 'page_bloc.dart';
 
abstract class PageEvent extends Equatable {
  const PageEvent();
}

class InitPageEvent extends PageEvent {
  @override 
  List<Object?> get props => [];
}

class LoadPageEvent extends PageEvent{
  final int number;

  const LoadPageEvent(this.number);

  @override
  List<Object?> get props => [number];
}


class LoadPageNameEvent extends PageEvent{
  final String pageName;

  const LoadPageNameEvent(this.pageName);

  @override
  List<Object?> get props => [pageName];
}


 