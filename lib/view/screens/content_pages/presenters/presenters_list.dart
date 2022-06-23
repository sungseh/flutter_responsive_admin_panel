import 'dart:developer';

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
  ScrollController? controller;


  @override
  void initState() {
    _presentersBloc = BlocProvider.of<PresentersBloc>(context); 
    controller = ScrollController()..addListener(_scrollListener); 
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

  void _scrollListener(){
    double? maxScroll = controller?.position.maxScrollExtent;
    double? currentScroll = controller?.position.pixels;
    if (currentScroll == maxScroll){ 
      _presentersBloc.add(const LoadPresentersEvent());
    }
  }

  Widget _buildPresenters(){
    return BlocBuilder<PresentersBloc, PresentersState>(
       builder: (context, state) {
        if (state is! PresentersLoadedState) {
          _presentersBloc.add(const LoadPresentersEvent());
          return ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (_, int index){
              return Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(4),
                height: 100,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "The current state is $state"
                  ),
                ),
              ); 
            }
          );
        } else {
          List<PresenterModel?>? presenters = state.presenters;  

          if(presenters!.isEmpty){
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (_, int index){
                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(4),
                  height: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      "The current state is $state: Empty"
                    ),
                  ),
                );
              }
            ); 
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                print("You have reached the end");
                // _presentersBloc.add(const RefreshPresentersEvent());
              },
              child: ListView.builder(
                controller: controller,
                shrinkWrap: true, 
                // itemCount: presenters.length,
                // itemCount: 20,
                itemCount: state.hasReachedLimit!
                  ? presenters.length
                  : presenters.length + 1,
                itemBuilder: (context, index) => (index < presenters.length) ?
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(4),
                    color: Colors.blue,
                    height: 100,
                    child: Center(
                      child: Text(
                        "The current state is $state: NOT Empty"
                      ),
                    ),
                  ) :
                  Center (
                    child: Column(
                      children: const <Widget> [
                        SizedBox(
                          height: 16,
                        ), 
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: CircularProgressIndicator()
                        )
                      ] 
                    )
                  )
              )
            );
          }
        } 
      }
    );
  }


  Widget _buildPresenterss(){
    return BlocBuilder<PresentersBloc, PresentersState>(
      builder: (context, state) {
        if (state is! PresentersLoadedState) {
          _presentersBloc.add(const LoadPresentersEvent());
        
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (_, int index){
              return const AppPresenterItem(item: null);
            }
          );
        } else {
          List<PresenterModel?>? presenters = state.presenters;  

          if(presenters!.isEmpty){
            return const AppEmptyContent(
              title: "No Presenter",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                _presentersBloc.add(const RefreshPresentersEvent());
              },
              child: ListView.builder(
                controller: controller,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.hasReachedLimit!
                  ? presenters.length
                  : presenters.length + 1, 
                itemBuilder: (context, index) => (index < presenters.length) ?
                  AppPresenterItem( 
                    item: presenters[index]!,
                  ) :
                  Center (
                    child: Column(
                      children: const <Widget> [
                        SizedBox(
                          height: 16,
                        ), 
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: CircularProgressIndicator()
                        )
                      ] 
                    )
                  ) 
              )
            );
          }
        }
      }
    );
  }

  Widget _buildPresenter(){
    return BlocBuilder<PresentersBloc, PresentersState>(
      builder: (context, state) { 
        if (state is! PresentersLoadedState) {
          _presentersBloc.add(const LoadPresentersEvent());
        
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (_, int index){
              return const AppPresenterItem(item: null);
            }
          );
        } else {
          List<PresenterModel?>? presenters = state.presenters;  

          if(presenters!.isEmpty){
            return const AppEmptyContent(
              title: "No Presenter",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return ListView.builder(
              controller: controller,
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