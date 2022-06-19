import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

import '../../../../blocs/presenters/presenters_bloc.dart';
import 'presenters_add.dart';

class PresentersList extends StatefulWidget {
  const PresentersList({Key? key}) : super(key: key);

  @override
  State<PresentersList> createState() => _PresentersListState();
}

class _PresentersListState extends State<PresentersList> {
  late PresentersBloc _presentersBloc;

  @override
  void initState() {
    _presentersBloc = BlocProvider.of<PresentersBloc>(context);
    _presentersBloc.add(const LoadPresenters()); 
    super.initState();
  }

  _onTapAdd(PresenterModel? item) {
  }

  _onTapPresenter(PresenterModel? item) {
    // Navigator.pushNamed(
    //   context,
    //   Routes.presenterPlayer,
    //   arguments: item
    // );
  }

  Widget _buildPresenters(){
    return BlocBuilder<PresentersBloc, PresentersState>(
      builder: (context, state) { 
        if (state is PresentersLoaded) {
          List<PresenterModel?>? presenters = state.presenters;  

          if(presenters!.isEmpty){
            return const AppEmptyContent(
              title: "No Presenters",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: presenters.length,
              itemBuilder: (_, int index) {
                return AppPresenterItem( 
                  item: presenters[index]!,
                );
              }
            );
          }
        }

        return ListView.builder(
          itemCount: 20,
          itemBuilder: (_, int index){
            return const AppPresenterItem(item: null); 
          }
        );

        // return Container(
        //   color: Colors.red,
        //   child: Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // );

        // return ListView.builder(
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.only(top: 30, bottom: 20),
        //   physics: const AlwaysScrollableScrollPhysics(),
        //   itemCount: 20,
        //   itemBuilder: (_, int index) {
        //     return const AppPresenterItem(item: null); 
        //   }
        // );
 
      }
    ); 
  }
  
 

  @override
  Widget build(BuildContext context) {
    return AppSectionFrame(
      listSection: _buildPresenters(),
      addSection: const AddPresenter() 
    );
  }
}