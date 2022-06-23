part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitAuthEvent extends AuthEvent {}

class LoadAuthEvent extends AuthEvent {}

// When the user signing in with email and password this event is called and the [AuthRepository] is called to sign in the user
class SignInRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  SignInRequestedEvent(this.email, this.password);
}

// When the user signing up with email and password this event is called and the [AuthRepository] is called to sign up the user
class SignUpRequestedEvent extends AuthEvent {
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  SignUpRequestedEvent(this.firstname, this.lastname, this.email, this.password);
}

// When the user signing in with google this event is called and the [AuthRepository] is called to sign in the user
class GoogleSignInRequestedEvent extends AuthEvent {}

// When the user signing out this event is called and the [AuthRepository] is called to sign out the user
class SignOutRequestedEvent extends AuthEvent {}
