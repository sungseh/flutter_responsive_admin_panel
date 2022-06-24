import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/repositories/firestore/subscriptions_firestore.dart';
part 'subscriptions_event.dart';
part 'subscriptions_state.dart';
  
class SubscriptionsBloc extends Bloc<SubscriptionsEvent, SubscriptionsState> { 
  final SubscriptionsFirestore? _subscriptionsRepo;
  StreamSubscription? _subscriptionsSub;  

  SubscriptionsBloc({ 
    required SubscriptionsFirestore? subscriptionsRepo, 
  }) : 
  assert(subscriptionsRepo != null),
  _subscriptionsRepo = subscriptionsRepo,
  super(SubscriptionsLoadingState()) {
    on<LoadSubscriptionsEvent>(_onLoadSubscriptions);
    on<UpdateSubscriptionsEvent>(_onUpdateSubscriptions);
  }

  void _onLoadSubscriptions(LoadSubscriptionsEvent event, Emitter<SubscriptionsState> emit) async {
    emit(SubscriptionsLoadingState());
    _subscriptionsSub?.cancel();
    _subscriptionsSub = _subscriptionsRepo?.subscriptions()
      .listen((subscriptions) => add(UpdateSubscriptionsEvent(subscriptions))); 
  }

  void _onUpdateSubscriptions(UpdateSubscriptionsEvent event, Emitter<SubscriptionsState> emit) async {
    emit(SubscriptionsLoadedState( 
      subscriptions: event.subscriptions, 
    ));
  }
}

 
