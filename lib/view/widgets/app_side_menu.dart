import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/page/page_bloc.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppSideMenu extends StatefulWidget {
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
  bool? changePageByTapView;
  PageController? pageController;

  final void Function()? onPressed;


 
  AppSideMenu({
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
    this.changePageByTapView,
    this.pageController,

    this.onPressed
  }) : super(key: key);

  @override
  State<AppSideMenu> createState() => _AppSideMenuState();
}

class _AppSideMenuState extends State<AppSideMenu> {
  // PageController pageController = PageController();
  // selectedIndex = index; 
  List<AnimationController> animationControllers = []; 


  // void _onClick(List selectTab){
  //   widget.changePageByTapView = true;

  //   setState(() {
  //     selectTab(index);
  //   });

  //   widget.pageController.animateToPage(
  //     index,
  //     duration: widget.changePageDuration,
  //     curve: widget.changePageCurve
  //   );
  // }

  _onClick(){
    print("Yes it is clicked");
    // BlocProvider.of<SecscreenBloc>(context).add(LoadSecscreenEvent(state.number)),
    BlocProvider.of<PageBloc>(context).add(ClickTab("state.number"));
  }
 
 
  @override 
  Widget build(BuildContext context) {  
    return Material( 
      elevation: widget.tabsElevation,
      shadowColor: widget.tabsShadowColor,
      shape: const BeveledRectangleBorder(),
      child: Container(
        color: Colors.yellow,
        child: Center(
          child: ElevatedButton(
            // onPressed: widget.onPressed,
            onPressed: _onClick,
            child: const Text(
              "Click Me"
            ),  
          ),
        ),
      ),


      /*
      child: Column(
        children: [
          widget.drawerHeader as Widget,
          // drawerHeader,
          SizedBox(
            // width: widget.tabsWidth,
            width: 250,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.drawerTile?.length,
              itemBuilder: (context, index){
                Color itemBGColor =  widget.tabBackgroundColor;
                Widget? child;
                Alignment alignment = Alignment.centerLeft;
                AppDrawerListTile drawerListTiles = widget.drawerTile![index];

                // if(drawerListTiles.child != null){
                //   child = drawerListTiles.child;
                // }

                if(drawerListTiles == null){
                  child = drawerListTiles;
                } else {
                  child = Container(
                    padding: const EdgeInsets.all(8),
                    color: widget.tabBackgroundColor,
                    child: Row(
                      children: [ 
                        SizedBox(
                          // width: widget.tabsWidth - 50,
                          width: widget.tabsWidth,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // SizedBox(height:20.0),
                              AppExpansionTile(
                                title: drawerListTiles.title,
                                svgSrc: drawerListTiles.svgSrc, 
                                press: () {  },  
                                children: const <Widget>[ 
                                  ListTile(
                                    title: Text(
                                      'All Videos',
                                      // style: TextStyle(
                                      //   color: Colors.white54
                                      // ), 
                                    ),
                                    // horizontalTitleGap: 0.0,
                                    contentPadding: EdgeInsets.only(
                                      left: 54
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Add New Videos',
                                      // style: TextStyle(
                                      //   color: Colors.white54
                                      // ), 
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      left: 54
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // (drawerListTiles.svgSrc != null) ?
                        // Row(
                        //   children: [
                        //     Container(
                        //       decoration: BoxDecoration(
                        //         image: DecorationImage(
                        //           image: AssetImage(drawerListTiles.svgSrc),
                        //         )
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 5,
                        //     )
                        //   ],
                        // ): Container(),

                        // (drawerListTiles.title != null) ? 
                        // SizedBox(
                        //   width: widget.tabsWidth - 50,
                        //   child: Text(
                        //     drawerListTiles.title,
                        //     softWrap: true,
                        //     style: _selectedIndex == index ?
                        //       widget.selectedTabTextStyle :
                        //       widget.tabTextStyle
                        //   ),
                        // ) : Container() 
                      ],
                    ),
                  );
                }

                return Stack(
                  children: [
                    Positioned(
                      top: 2,
                      bottom: 2, 
                      child: ScaleTransition(
                        scale: Tween(
                          begin: 0.0,
                          end: 1.0
                        ).animate(
                          CurvedAnimation(
                            parent: animationControllers[index], 
                            curve: Curves.elasticOut
                          )
                        ),
                        child: Container(
                          color: widget.indicatorColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      // onTap: (){
                      //   _changePageByTapView = true;
                      //   setState(() {
                      //     _selectTab(index);
                      //   });

                      //   pageController.animateToPage(
                      //     index, 
                      //     duration: widget.changePageDuration, 
                      //     curve: widget.changePageCurve
                      //   );
                      // },
                      child: Container(
                        decoration: BoxDecoration(
                          color: itemBGColor, 
                        ),
                        alignment: alignment,
                        padding: const EdgeInsets.all(5),
                        child: child,
                      ),
                    )
                  ]
                );
              }
            ),
          ),
        ],
      )
    */
    );  
  }
}




