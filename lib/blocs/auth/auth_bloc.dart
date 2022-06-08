import 'package:bloc/bloc.dart'; 
import 'package:equatable/equatable.dart';
import 'package:flutter_responsive_admin_panel/blocs/app_bloc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/repositories/firestore/auth_firestore.dart';
import 'package:flutter_responsive_admin_panel/repositories/firestore/user_firestore.dart';  

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthFirestore authRepository;

  AuthBloc({
    required this.authRepository
  }) :
  super(UnAuthenticated()) {
    on<InitAuth>(_onInitAuth); 
    on<LoadAuth>(_onLoadAuth); 
    on<SignInRequested>(_onSignInRequested); 
    on<SignUpRequested>(_onSignUpRequested); 
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  void _onInitAuth(InitAuth event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    UserModel? user = await AppBloc.userCubit.onLoadUser();
    if (user != null) {
      await AppBloc.userCubit.onSaveUser(user);
      await AppBloc.userCubit.onFetchUser();
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  } 
 
  void _onLoadAuth(LoadAuth event, Emitter<AuthState> emit) async {
  }
 
  void _onSignInRequested(SignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await authRepository.signIn(
        email: event.email, 
        password: event.password
      );
      if(result != null){ 
        UserModel? user = await UserFirestore.getUser(result.user!.uid);
        await AppBloc.userCubit.onSaveUser(user!); 
        emit(Authenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }
 
  void _onSignUpRequested(SignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.signUp(email: event.email, password: event.password);
      // UserRepository.createUser(
      UserFirestore.createUser(
        UserModel(
          firstname: event.firstname,
          lastname: event.lastname,
          email: event.email,  
        )
      );
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }
 
  void _onGoogleSignInRequested(GoogleSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.signInWithGoogle();
      // UserRepository.createUser(
      //   UserModel(
      //     firstname: event.firstname,
      //     lastname: event.lastname,
      //     email: event.email,  
      //   )
      // );
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }
 
  void _onSignOutRequested(SignOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await authRepository.signOut();
    AppBloc.userCubit.onDeleteUser();
    emit(UnAuthenticated()); 
  } 
}
