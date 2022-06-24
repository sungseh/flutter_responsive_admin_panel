import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

class SubscriptionList extends StatefulWidget {
  const SubscriptionList({Key? key}) : super(key: key);

  @override
  State<SubscriptionList> createState() => _SubscriptionListState();
}

class _SubscriptionListState extends State<SubscriptionList> {
  late SubscriptionsBloc _audiosBloc;

  @override
  void initState() {
    _audiosBloc = BlocProvider.of<SubscriptionsBloc>(context);
    // _audiosBloc.add(const LoadSubscriptions()); 
    super.initState();
  }
 

  Widget _buildSubscriptions(){
    return BlocBuilder<SubscriptionsBloc, SubscriptionsState>(
      builder: (context, state) { 
        if (state is! SubscriptionsLoadedState) {
          _audiosBloc.add(const LoadSubscriptionsEvent());
        
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (_, int index){
              return const AppPresenterItem(item: null);
            }
          );
        } else {
          List<SubscriptionModel?>? subscriptions = state.subscriptions; 

          if(subscriptions!.isEmpty){
            return const AppEmptyContent(
              title: "No Subscription",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: subscriptions.length,
              itemBuilder: (_, int index) {
                return AppSubscriptionItem( 
                  item: subscriptions[index]!,
                );
              }
            );
          }
        }
      }
    ); 
  }  

  @override
  Widget build(BuildContext context) {
    return AppSectionFrame(
      hasAddSection: false,
      listSection: _buildSubscriptions(), 
      addSection: Container(),
    );
  }
}