part of 'subscriptions_bloc.dart';

abstract class SubscriptionsEvent extends Equatable {
  const SubscriptionsEvent();

  @override
  List<Object> get props => [];
}
  
class LoadSubscriptionsEvent extends SubscriptionsEvent { 
  const LoadSubscriptionsEvent();

  @override
  List<Object> get props => [];
}

class UpdateSubscriptionsEvent extends SubscriptionsEvent { 
  final List<SubscriptionModel?>? subscriptions; 

  const UpdateSubscriptionsEvent(this.subscriptions);

  @override
  List<Object> get props => [subscriptions!]; 
}
