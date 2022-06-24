import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseInitialState()) {
    on<BaseEvent>((event, emit) { 
    });
  }
}
