import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import '../../repositories/firestore/firestore_repo.dart';
part 'users_event.dart';
part 'users_state.dart';
  
class UsersBloc extends Bloc<UsersEvent, UsersState> { 
  final UsersFirestore? _usersRepo;
  StreamSubscription? _usersSub;  

  UsersBloc({ 
    required UsersFirestore? usersRepo, 
  }) : 
  assert(usersRepo != null),
  _usersRepo = usersRepo,
  super(UsersLoadingState()) {
    on<LoadUsersEvent>(_onLoadUsers);
    on<UpdateUsersEvent>(_onUpdateUsers);
  }

  void _onLoadUsers(LoadUsersEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoadingState());
    _usersSub?.cancel();
    _usersSub = _usersRepo?.users()
      .listen((users) => add(UpdateUsersEvent(users))); 
  }

  void _onUpdateUsers(UpdateUsersEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoadedState( 
      users: event.users, 
    ));
  }
}

 
