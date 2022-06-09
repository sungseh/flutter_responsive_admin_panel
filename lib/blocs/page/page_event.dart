part of 'page_bloc.dart';

// abstract class PageEvent extends Equatable {
//   const PageEvent();

//   @override
//   List<Object> get props => [];
// }



abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}
  
class ClickTab extends PageEvent { 
  final String name;

  const ClickTab(this.name);

  @override
  List<Object> get props => [];
}

// class UpdateAudios extends PageEvent { 
//   // final List<AudioModel?>? audios; 

//   const UpdateAudios(this.audios);

//   @override
//   List<Object> get props => [audios!]; 
// }
