import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/view/screens/content_pages/content_pages.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

class AppPageFrame extends StatefulWidget {  
  final Widget sideMenu;
  
  const AppPageFrame({
    Key? key,   
    required this.sideMenu, 
  }) : super(key: key);

  @override
  State<AppPageFrame> createState() => _AppPageFrameState();
}

class _AppPageFrameState extends State<AppPageFrame> {  
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ConfigResponsive.isDesktop(context)) 
          Expanded( 
            child: widget.sideMenu, 
          ),
        Expanded(
          flex: 5,
          child: Center(
            child: BlocBuilder<PageBloc, PageState>(
              builder: (context, state){
                if(state is PageLoadedState){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Activity: ${state.number}"), 
                      ],
                    ),
                  );
                } else if(state is PageNameLoadedState){
                  switch (state.pageName) {
                    case "Dashboard":
                      return const Dashboard();

                    case "Audio": 
                      return const AudiosList();
                       
                    case "Videos":
                      return const VideosList(); 

                    case "Categories":
                      return const CategoriesList(); 

                    case "Presenters":
                      return const PresentersList(); 

                    case "Settings":
                      return const Settings(); 

                    default:
                      return const Page404(); 
                  } 
                }
                return Container(
                  color: Colors.red,
                );
              }
            ), 
          ),
        ),
      ],
    );
    
  }
}