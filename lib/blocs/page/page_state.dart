part of 'page_bloc.dart';
 
 
abstract class PageState extends Equatable {
  const PageState();
}

class PageInitial extends PageState {
  @override
  List<Object> get props => [];
}

class PageLoadedState extends PageState{
  final int number;
  PageLoadedState(this.number);

  @override
  List<Object?> get props => [number];
}



// abstract class PageState extends Equatable {
//   const PageState();
  
//   @override
//   List<Object> get props => [];
// }

// class PageInitial extends PageState {}

// class PageClicked extends PageState {
//   final String name;

//   PageClicked(this.name);

//   @override
//   List<Object> get props => [];
// }

// // class AudiosLoaded extends PageState {  
// //   final List<AudioModel?>? audios; 

// //   const AudiosLoaded({this.audios});

// //   @override
// //   List<Object> get props => [audios!];

// //   @override
// //   String toString() => 'AudiosLoaded  {audios: $audios}';
// // }
 
// // class AudiosNotLoaded extends PageState {
// //   @override
// //   List<Object> get props => [];
// // }

// // class AudiosIsEmpty extends PageState {
// //   @override
// //   List<Object> get props => [];
// // }
