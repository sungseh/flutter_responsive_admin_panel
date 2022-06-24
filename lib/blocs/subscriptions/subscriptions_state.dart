part of 'subscriptions_bloc.dart';

abstract class SubscriptionsState extends Equatable {
  const SubscriptionsState();
  
  @override
  List<Object> get props => [];
}

class SubscriptionsInitialState extends SubscriptionsState {}

class SubscriptionsLoadingState extends SubscriptionsState {
  @override
  List<Object> get props => [];
}

class SubscriptionsLoadedState extends SubscriptionsState {  
  final List<SubscriptionModel?>? subscriptions; 

  const SubscriptionsLoadedState({this.subscriptions});

  @override
  List<Object> get props => [subscriptions!];

  @override
  String toString() => 'SubscriptionsLoaded  {subscriptions: $subscriptions}';
}
 
class SubscriptionsNotLoadedState extends SubscriptionsState {
  @override
  List<Object> get props => [];
}

class SubscriptionsIsEmptyState extends SubscriptionsState {
  @override
  List<Object> get props => [];
}
