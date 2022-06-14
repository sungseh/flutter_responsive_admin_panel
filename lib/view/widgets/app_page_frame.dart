import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/view/screens/content_pages/content_pages.dart';
import 'package:flutter_responsive_admin_panel/view/screens/content_pages/videos/videos_list.dart';
import 'package:flutter_responsive_admin_panel/view/screens/screens.dart';  
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

class AppPageFrame extends StatefulWidget { 
  final int initialIndex;
  final double tabsWidth;
  final double indicatorWidth;
  final IndicatorSide? indicatorSide;
  final List<Tab>? tabs;
  final DrawerHeader? drawerHeader;
  final List<AppDrawerListTile>? drawerTile;
  final List<Widget>? contents;
  final TextDirection direction;
  final Color indicatorColor;
  final bool disabledChangePageFromContentView;
  final Axis contentScrollAxis;
  final Color selectedTabBackgroundColor;
  final Color tabBackgroundColor;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final Duration changePageDuration;
  final Curve changePageCurve;
  final Color? tabsShadowColor;
  final double tabsElevation;
  final Function(int? tabIndex)? onSelect;
  final Color? backgroundColor;
  final Widget sideMenu;

  String? text;
  final void Function()? onPressed;
 
  AppPageFrame({
    Key? key,  
    this.initialIndex = 0,
    this.tabsWidth = 200, 
    this.indicatorWidth = 3,
    this.indicatorSide, 
    this.tabs, 
    this.drawerHeader,
    this.drawerTile,
    this.contents, 
    this.direction = TextDirection.ltr,
    this.indicatorColor = Colors.green,
    this.disabledChangePageFromContentView = false,
    this.contentScrollAxis = Axis.horizontal,
    this.selectedTabBackgroundColor = const Color(0x1100ff00),
    this.tabBackgroundColor = const Color(0xfff8f8f8),
    this.selectedTabTextStyle = const TextStyle(color: Colors.black),
    this.tabTextStyle = const TextStyle(color: Colors.black38), 
    this.changePageDuration = const Duration(milliseconds: 300), 
    this.changePageCurve = Curves.easeInOut, 
    this.tabsShadowColor = Colors.black54,
    this.tabsElevation = 2.0, 
    this.onSelect, 
    this.backgroundColor,
    required this.sideMenu,
    this.text,
    this.onPressed

  }) : super(key: key);

  @override
  State<AppPageFrame> createState() => _AppPageFrameState();
}

class _AppPageFrameState extends State<AppPageFrame> { 
  _onClick(){
    // print("Yes it is clicked");
    setState(() {
      widget.text = "The button has been clicked";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // We want this side menu only for large screen
        if (ConfigResponsive.isDesktop(context)) 
          Expanded(
            // default flex = 1
            // and it takes 1/6 part of the screen
            // child: AppSideMenu(),
            child: widget.sideMenu,
            // child: AppSideMenu(
            //   onPressed: _onClick, 
            // ),


            // child: Material( 
            //   elevation: widget.tabsElevation,
            //   shadowColor: widget.tabsShadowColor,
            //   shape: const BeveledRectangleBorder(),
            //   child: Container(
            //     color: Colors.yellow,
            //     child: Center(
            //       child: ElevatedButton(
            //         onPressed: _onClick,
            //         child: const Text(
            //           "Click Me"
            //         ),  
            //       ),
            //     ),
            //   ),
            // )
          ),
        Expanded(
          // It takes 5/6 part of the screen
          flex: 5,
          // child: DashboardScreen(),
          child: Center(
            child: BlocBuilder<PageBloc, PageState>(
              builder: (context, state){
                if(state is PageLoadedState){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Activity: ${state.number}"),
                        // const SizedBox(height: 30),
                        // ElevatedButton(
                        //   onPressed: () => BlocProvider.of<PageBloc>(context)
                        //     .add(LoadPageEvent(state.number)), 
                        //   child: const Icon(Icons.add),
                        // ),
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