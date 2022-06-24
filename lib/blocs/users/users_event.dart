part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}
  
class LoadUsersEvent extends UsersEvent { 
  const LoadUsersEvent();

  @override
  List<Object> get props => [];
}

class UpdateUsersEvent extends UsersEvent { 
  final List<UserModel?>? users; 

  const UpdateUsersEvent(this.users);

  @override
  List<Object> get props => [users!]; 
}
