
import 'package:flutter_responsive_admin_panel/models/models.dart';

abstract class SubscriptionsRepo {
  Stream<List<SubscriptionModel>> subscriptions();
  Stream<List<SubscriptionModel>>? subscriptionsList();
  // Future<List<SubscriptionModel>> fetchPosts(int page); 
  Stream<List<SubscriptionModel>>? subscriptionsByCategory(CategoryModel category);
}
