import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/app_side_menu.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart'; 

enum IndicatorSide { start, end }

class AppPageFramework extends StatefulWidget {
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
 
  const AppPageFramework({
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
  }) : super(key: key);

  @override
  State<AppPageFramework> createState() => _AppPageFrameworkState();
}

class _AppPageFrameworkState extends State<AppPageFramework> with TickerProviderStateMixin {
  int? _selectedIndex;
  bool? _changePageByTapView;
  AnimationController? animationController;
  Animation<double>? animation;
  Animation<RelativeRect>? rectAnimation;
  PageController pageController = PageController();
  List<AnimationController> animationControllers = [];
  ScrollPhysics pageScrollPhysics = const AlwaysScrollableScrollPhysics();

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    for (int i = 0; i < widget.tabs!.length; i++) {
      animationControllers.add(AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ));
    }
    _selectTab(widget.initialIndex);

    if (widget.disabledChangePageFromContentView == true) {
      pageScrollPhysics = const NeverScrollableScrollPhysics();
    }

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpToPage(widget.initialIndex);
      setState(() {});
    });
  }

  void _selectTab(index) {
    _selectedIndex = index;
    for (AnimationController animationController in animationControllers) {
      animationController.reset();
    }
    animationControllers[index].forward();

    if (widget.onSelect != null) {
      widget.onSelect!(_selectedIndex);
    }
  }


  @override
  Widget build(BuildContext context) {
    // Border border = Border(
    //   right: BorderSide(
    //     width: 0.5, 
    //     color: widget.dividerColor
    //   )
    // );

    // if (widget.direction == TextDirection.rtl) {
    //   border = Border(
    //     left: BorderSide(
    //       width: 0.5, 
    //       color: widget.dividerColor
    //     )
    //   );
    // }

    // return Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     // We want this side menu only for large screen
    //     if (ConfigResponsive.isDesktop(context)) 
    //       const Expanded(
    //         // default flex = 1
    //         // and it takes 1/6 part of the screen
    //         child: AppSideMenu(),
    //       ),
    //     Expanded(
    //       // It takes 5/6 part of the screen
    //       flex: 5,
    //       // child: DashboardScreen(),
    //       child: Container(
    //         color: Colors.blue,
    //       ),
    //     ),
    //   ],
    // );


    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // We want this side menu only for large screen
        if (ConfigResponsive.isDesktop(context)) 
          Expanded(
            // default flex = 1
            flex: 1,
            // and it takes 1/6 part of the screen
            // ignore: unnecessary_const
            child: widget.sideMenu,
            // child: Material( 
            //   elevation: widget.tabsElevation,
            //   shadowColor: widget.tabsShadowColor,
            //   shape: const BeveledRectangleBorder(),
            //   child: Column(
            //     children: [
            //       widget.drawerHeader as Widget,
            //       SizedBox(
            //         // width: widget.tabsWidth,
            //         width: 250,
            //         child: ListView.builder(
            //           shrinkWrap: true,
            //           itemCount: widget.drawerTile?.length,
            //           itemBuilder: (context, index){
            //             Color itemBGColor =  widget.tabBackgroundColor;
            //             Widget? child;
            //             Alignment alignment = Alignment.centerLeft;
            //             DrawerListTile drawerListTiles = widget.drawerTile![index];

            //             // if(drawerListTiles.child != null){
            //             //   child = drawerListTiles.child;
            //             // }

            //             if(drawerListTiles == null){
            //               child = drawerListTiles;
            //             } else {
            //               child = Container(
            //                 padding: const EdgeInsets.all(8),
            //                 color: widget.tabBackgroundColor,
            //                 child: Row(
            //                   children: [ 
            //                     SizedBox(
            //                       // width: widget.tabsWidth - 50,
            //                       width: widget.tabsWidth,

            //                       child: Column(
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: <Widget>[
            //                           // SizedBox(height:20.0),
            //                           AppExpansionTile(
            //                             title: drawerListTiles.title,
            //                             svgSrc: drawerListTiles.svgSrc, 
            //                             press: () {  },  
            //                             children: const <Widget>[ 
            //                               ListTile(
            //                                 title: Text(
            //                                   'All Videos',
            //                                   // style: TextStyle(
            //                                   //   color: Colors.white54
            //                                   // ), 
            //                                 ),
            //                                 // horizontalTitleGap: 0.0,
            //                                 contentPadding: EdgeInsets.only(
            //                                   left: 54
            //                                 ),
            //                               ),
            //                               ListTile(
            //                                 title: Text(
            //                                   'Add New Videos',
            //                                   // style: TextStyle(
            //                                   //   color: Colors.white54
            //                                   // ), 
            //                                 ),
            //                                 contentPadding: EdgeInsets.only(
            //                                   left: 54
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     // (drawerListTiles.svgSrc != null) ?
            //                     // Row(
            //                     //   children: [
            //                     //     Container(
            //                     //       decoration: BoxDecoration(
            //                     //         image: DecorationImage(
            //                     //           image: AssetImage(drawerListTiles.svgSrc),
            //                     //         )
            //                     //       ),
            //                     //     ),
            //                     //     const SizedBox(
            //                     //       width: 5,
            //                     //     )
            //                     //   ],
            //                     // ): Container(),

            //                     // (drawerListTiles.title != null) ? 
            //                     // SizedBox(
            //                     //   width: widget.tabsWidth - 50,
            //                     //   child: Text(
            //                     //     drawerListTiles.title,
            //                     //     softWrap: true,
            //                     //     style: _selectedIndex == index ?
            //                     //       widget.selectedTabTextStyle :
            //                     //       widget.tabTextStyle
            //                     //   ),
            //                     // ) : Container() 
            //                   ],
            //                 ),
            //               );
            //             }

            //             return Stack(
            //               children: [
            //                 Positioned(
            //                   top: 2,
            //                   bottom: 2, 
            //                   child: ScaleTransition(
            //                     scale: Tween(
            //                       begin: 0.0,
            //                       end: 1.0
            //                     ).animate(
            //                       CurvedAnimation(
            //                         parent: animationControllers[index], 
            //                         curve: Curves.elasticOut
            //                       )
            //                     ),
            //                     child: Container(
            //                       color: widget.indicatorColor,
            //                     ),
            //                   ),
            //                 ),
            //                 GestureDetector(
            //                   onTap: (){
            //                     _changePageByTapView = true;
            //                     setState(() {
            //                       _selectTab(index);
            //                     });

            //                     pageController.animateToPage(
            //                       index, 
            //                       duration: widget.changePageDuration, 
            //                       curve: widget.changePageCurve
            //                     );
            //                   },
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                       color: itemBGColor, 
            //                     ),
            //                     alignment: alignment,
            //                     padding: const EdgeInsets.all(5),
            //                     child: child,
            //                   ),
            //                 )
            //               ]
            //             );
            //           }
            //         ),
            //       ),
            //     ],
            //   )
            // ),
          ),
          Expanded(
            flex: 4,
            child: PageView.builder(
              scrollDirection: widget.contentScrollAxis,
              physics: pageScrollPhysics,
              onPageChanged: (index) {
                if (_changePageByTapView == false || _changePageByTapView == null) {
                  _selectTab(index);
                }
                if (_selectedIndex == index) {
                  _changePageByTapView = null;
                }
                setState(() {});
              },
              controller: pageController,

              // the number of pages
              itemCount: widget.contents!.length,

              // building pages
              itemBuilder: (BuildContext context, int index) {
                return widget.contents![index];
              },
            ),
          ),
        // Expanded(
        //   // It takes 5/6 part of the screen
        //   flex: 5,
        //   // child: DashboardScreen(),
        //   child: Container(
        //     color: Colors.blue,
        //   ),
          
        // ),
      ],
    );

    // return Directionality(
    //   textDirection: widget.direction,
    //   child: Container(
    //     // color: widget.backgroundColor ?? Theme.of(context).canvasColor,
    //     color: Theme.of(context).canvasColor,
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         Expanded(
    //           child: Row(
    //             children: <Widget>[
    //               Material( 
    //                 elevation: widget.tabsElevation,
    //                 shadowColor: widget.tabsShadowColor,
    //                 shape: const BeveledRectangleBorder(),
    //                 child: Column(
    //                   children: [
    //                     widget.drawerHeader as Widget,
    //                     SizedBox(
    //                       // width: widget.tabsWidth,
    //                       width: 250,
    //                       child: ListView.builder(
    //                         shrinkWrap: true,
    //                         itemCount: widget.drawerTile?.length,
    //                         itemBuilder: (context, index){
    //                           Color itemBGColor =  widget.tabBackgroundColor;
    //                           Widget? child;
    //                           Alignment alignment = Alignment.centerLeft;
    //                           DrawerListTile drawerListTiles = widget.drawerTile![index];

    //                           // if(drawerListTiles.child != null){
    //                           //   child = drawerListTiles.child;
    //                           // }

    //                           if(drawerListTiles == null){
    //                             child = drawerListTiles;
    //                           } else {
    //                             child = Container(
    //                               padding: const EdgeInsets.all(8),
    //                               color: widget.tabBackgroundColor,
    //                               child: Row(
    //                                 children: [ 
    //                                   SizedBox(
    //                                     // width: widget.tabsWidth - 50,
    //                                     width: widget.tabsWidth,

    //                                     child: Column(
    //                                       crossAxisAlignment: CrossAxisAlignment.start,
    //                                       children: <Widget>[
    //                                         // SizedBox(height:20.0),
    //                                         AppExpansionTile(
    //                                           title: drawerListTiles.title,
    //                                           svgSrc: drawerListTiles.svgSrc, 
    //                                           press: () {  },  
    //                                           children: const <Widget>[ 
    //                                             ListTile(
    //                                               title: Text(
    //                                                 'All Videos',
    //                                                 // style: TextStyle(
    //                                                 //   color: Colors.white54
    //                                                 // ), 
    //                                               ),
    //                                               // horizontalTitleGap: 0.0,
    //                                               contentPadding: EdgeInsets.only(
    //                                                 left: 54
    //                                               ),
    //                                             ),
    //                                             ListTile(
    //                                               title: Text(
    //                                                 'Add New Videos',
    //                                                 // style: TextStyle(
    //                                                 //   color: Colors.white54
    //                                                 // ), 
    //                                               ),
    //                                               contentPadding: EdgeInsets.only(
    //                                                 left: 54
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   // (drawerListTiles.svgSrc != null) ?
    //                                   // Row(
    //                                   //   children: [
    //                                   //     Container(
    //                                   //       decoration: BoxDecoration(
    //                                   //         image: DecorationImage(
    //                                   //           image: AssetImage(drawerListTiles.svgSrc),
    //                                   //         )
    //                                   //       ),
    //                                   //     ),
    //                                   //     const SizedBox(
    //                                   //       width: 5,
    //                                   //     )
    //                                   //   ],
    //                                   // ): Container(),

    //                                   // (drawerListTiles.title != null) ? 
    //                                   // SizedBox(
    //                                   //   width: widget.tabsWidth - 50,
    //                                   //   child: Text(
    //                                   //     drawerListTiles.title,
    //                                   //     softWrap: true,
    //                                   //     style: _selectedIndex == index ?
    //                                   //       widget.selectedTabTextStyle :
    //                                   //       widget.tabTextStyle
    //                                   //   ),
    //                                   // ) : Container() 
    //                                 ],
    //                               ),
    //                             );
    //                           }

    //                           return Stack(
    //                             children: [
    //                               Positioned(
    //                                 top: 2,
    //                                 bottom: 2, 
    //                                 child: ScaleTransition(
    //                                   scale: Tween(
    //                                     begin: 0.0,
    //                                     end: 1.0
    //                                   ).animate(
    //                                     CurvedAnimation(
    //                                       parent: animationControllers[index], 
    //                                       curve: Curves.elasticOut
    //                                     )
    //                                   ),
    //                                   child: Container(
    //                                     color: widget.indicatorColor,
    //                                   ),
    //                                 ),
    //                               ),
    //                               GestureDetector(
    //                                 onTap: (){
    //                                   _changePageByTapView = true;
    //                                   setState(() {
    //                                     _selectTab(index);
    //                                   });

    //                                   pageController.animateToPage(
    //                                     index, 
    //                                     duration: widget.changePageDuration, 
    //                                     curve: widget.changePageCurve
    //                                   );
    //                                 },
    //                                 child: Container(
    //                                   decoration: BoxDecoration(
    //                                     color: itemBGColor, 
    //                                   ),
    //                                   alignment: alignment,
    //                                   padding: const EdgeInsets.all(5),
    //                                   child: child,
    //                                 ),
    //                               )
    //                             ]
    //                           );
    //                         }
    //                       ),
    //                     ),
    //                   ],
    //                 )
    //               ),
                  
    //               Expanded(
    //                 child: PageView.builder(
    //                   scrollDirection: widget.contentScrollAxis,
    //                   physics: pageScrollPhysics,
    //                   onPageChanged: (index) {
    //                     if (_changePageByTapView == false || _changePageByTapView == null) {
    //                       _selectTab(index);
    //                     }
    //                     if (_selectedIndex == index) {
    //                       _changePageByTapView = null;
    //                     }
    //                     setState(() {});
    //                   },
    //                   controller: pageController,

    //                   // the number of pages
    //                   itemCount: widget.contents!.length,

    //                   // building pages
    //                   itemBuilder: (BuildContext context, int index) {
    //                     return widget.contents![index];
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}