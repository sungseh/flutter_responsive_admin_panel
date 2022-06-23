part of 'auth_bloc.dart';

// @immutable
abstract class AuthState extends Equatable {}

class AuthInitializedState extends AuthState {
  @override
  List<Object?> get props => [];
}

// When the user presses the signin or signup 
//button the state is changed to loading first 
//and then to Authenticated.
class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is 
//changed to Authenticated.
class AuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When 
//the user is not authenticated the state is 
//changed to Unauthenticated.
class UnAuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed 
//to AuthError.
class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
