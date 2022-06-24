part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  
  @override
  List<Object> get props => [];
}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadedState extends UsersState {  
  final List<UserModel?>? users; 

  const UsersLoadedState({this.users});

  @override
  List<Object> get props => [users!];

  @override
  String toString() => 'UsersLoaded  {users: $users}';
}
 
class UsersNotLoadedState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersIsEmptyState extends UsersState {
  @override
  List<Object> get props => [];
}
