import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/app_item_user.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late UsersBloc _audiosBloc;

  @override
  void initState() {
    _audiosBloc = BlocProvider.of<UsersBloc>(context);
    // _audiosBloc.add(const LoadUsers()); 
    super.initState();
  }
 

  Widget _buildUsers(){
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) { 
        if (state is! UsersLoadedState) {
          _audiosBloc.add(const LoadUsersEvent());
        
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (_, int index){
              return const AppPresenterItem(item: null);
            }
          );
        } else {
          List<UserModel?>? users = state.users; 

          if(users!.isEmpty){
            return const AppEmptyContent(
              title: "No User",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (_, int index) {
                return AppUserItem( 
                  item: users[index]!,
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
      listSection: _buildUsers(), 
      addSection: Container(),
    );
  }
}