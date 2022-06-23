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
  super(UnAuthenticatedState()) {
    on<InitAuthEvent>(_onInitAuth); 
    on<LoadAuthEvent>(_onLoadAuth); 
    on<SignInRequestedEvent>(_onSignInRequested); 
    on<SignUpRequestedEvent>(_onSignUpRequested); 
    on<GoogleSignInRequestedEvent>(_onGoogleSignInRequested);
    on<SignOutRequestedEvent>(_onSignOutRequested);
  }

  void _onInitAuth(InitAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    UserModel? user = await AppBloc.userCubit.onLoadUser();
    if (user != null) {
      await AppBloc.userCubit.onSaveUser(user);
      await AppBloc.userCubit.onFetchUser();
      emit(AuthenticatedState());
    } else {
      emit(UnAuthenticatedState());
    }
  } 
 
  void _onLoadAuth(LoadAuthEvent event, Emitter<AuthState> emit) async {
  }
 
  void _onSignInRequested(SignInRequestedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final result = await authRepository.signIn(
        email: event.email, 
        password: event.password
      );
      if(result != null){ 
        UserModel? user = await UserFirestore.getUser(result.user!.uid);
        await AppBloc.userCubit.onSaveUser(user!); 
        emit(AuthenticatedState());
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnAuthenticatedState());
    }
  }
 
  void _onSignUpRequested(SignUpRequestedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
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
      emit(AuthenticatedState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnAuthenticatedState());
    }
  }
 
  void _onGoogleSignInRequested(GoogleSignInRequestedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await authRepository.signInWithGoogle();
      // UserRepository.createUser(
      //   UserModel(
      //     firstname: event.firstname,
      //     lastname: event.lastname,
      //     email: event.email,  
      //   )
      // );
      emit(AuthenticatedState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(UnAuthenticatedState());
    }
  }
 
  void _onSignOutRequested(SignOutRequestedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await authRepository.signOut();
    AppBloc.userCubit.onDeleteUser();
    emit(UnAuthenticatedState()); 
  } 
}
