import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/page/page_bloc.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppSideMenu extends StatefulWidget {
  final int initialIndex;
  final double tabsWidth;
  // final double indicatorWidth;
  // final IndicatorSide? indicatorSide;
  // final List<Tab>? tabs;
  final DrawerHeader? drawerHeader;
  final List<AppDrawerListTile>? drawerTiles;
  // final List<Widget>? contents;
  final TextDirection direction;
  final Color indicatorColor;
  final bool disabledChangePageFromContentView;
  // final Axis contentScrollAxis;
  final Color selectedTabBackgroundColor;
  final Color tabBackgroundColor;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final Duration changePageDuration;
  final Curve changePageCurve;
  // final Color? tabsShadowColor;
  // final double tabsElevation;
  final Function(int? tabIndex)? onSelect;
  // final Color? backgroundColor;
  // bool? changePageByTapView;
  // PageController? pageController; 


  // final void Function()? onPressed;


 
  AppSideMenu({
    Key? key,  
    this.initialIndex = 0,
    this.tabsWidth = 200, 
    // this.indicatorWidth = 3,
    // this.indicatorSide, 
    // this.tabs, 
    this.drawerHeader,
    this.drawerTiles,
    // this.contents, 
    this.direction = TextDirection.ltr,
    this.indicatorColor = Colors.green,
    this.disabledChangePageFromContentView = false,
    // this.contentScrollAxis = Axis.horizontal,
    this.selectedTabBackgroundColor = const Color(0x1100ff00),
    this.tabBackgroundColor = const Color(0xfff8f8f8),
    this.selectedTabTextStyle = const TextStyle(color: Colors.black),
    this.tabTextStyle = const TextStyle(color: Colors.black38), 
    this.changePageDuration = const Duration(milliseconds: 300), 
    this.changePageCurve = Curves.easeInOut, 
    // this.tabsShadowColor = Colors.black54,
    // this.tabsElevation = 2.0, 
    this.onSelect, 
    // this.backgroundColor,
    // this.changePageByTapView,
    // this.pageController,

    // this.onPressed
  }) : super(key: key);

  @override
  State<AppSideMenu> createState() => _AppSideMenuState();
}

class _AppSideMenuState extends State<AppSideMenu> with TickerProviderStateMixin{
  List<AnimationController> animationControllers = []; 
  ScrollPhysics pageScrollPhysics = const AlwaysScrollableScrollPhysics();
  PageController pageController = PageController();
  int? _selectedIndex;
  bool? _changePageByTapView;
  AnimationController? animationController;
  Animation<double>? animation;
  Animation<RelativeRect>? rectAnimation;



  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    for (int i = 0; i < widget.drawerTiles!.length; i++) {
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
    return Material(
      color: Colors.yellow,
      shadowColor: Colors.purple,
      shape: const BeveledRectangleBorder(),
      child: Column(
        children: [
          widget.drawerHeader as Widget,
          Container(
            color: Colors.yellow,
            child: BlocBuilder<PageBloc, PageState>(
              builder: (context, state){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("Activity: ${state.number}"),
                      // const SizedBox(height: 30),  
                      ElevatedButton(
                        onPressed: () => BlocProvider.of<PageBloc>(context)
                          .add(const LoadPageNameEvent("Page Name Here")), 
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                );



                /*
                if(state is PageLoadedState){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text("Activity: ${state.number}"),
                        // const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () => BlocProvider.of<PageBloc>(context)
                            .add(const LoadPageEvent(2)), 
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  );
                } else if(state is PageNameLoadedState){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text("Activity: ${state.number}"),
                        // const SizedBox(height: 30),  
                        ElevatedButton(
                          onPressed: () => BlocProvider.of<PageBloc>(context)
                            .add(const LoadPageNameEvent("Page Name Here")), 
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  );
                }
                */
                return Container(
                  color: Colors.red,
                );
              }
            ),  
          ),
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.drawerTiles?.length,
              // itemCount: 2,
              itemBuilder: (context, index){
                AppDrawerListTile drawerListTile = widget.drawerTiles![index];
                Color itemBGColor = widget.tabBackgroundColor;
                if (_selectedIndex == index) {
                  itemBGColor = widget.selectedTabBackgroundColor;
                }
                Alignment alignment = Alignment.centerLeft;
                if (widget.direction == TextDirection.rtl) {
                  alignment = Alignment.centerRight;
                }

                Widget? child;
                if (drawerListTile.child != null) {
                  child = drawerListTile.child;
                } else {
                  child = Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[ 
                        (drawerListTile.icon != null)
                        ? Row(
                            children: <Widget>[
                              drawerListTile.icon ?? Icon(Icons.close),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          )
                        : Container(),
                        (drawerListTile.title != null)
                        ? SizedBox(
                            width: widget.tabsWidth - 50,
                            child: Text(
                              drawerListTile.title,
                              softWrap: true,
                              style: _selectedIndex == index
                                  ? widget.selectedTabTextStyle
                                  : widget.tabTextStyle,
                            )
                          )
                        : Container(),
                      ],
                    )
                  );
                }

                return drawerListTile;
        

                // return Stack(
                //   children: [
                //     Positioned( 
                //       child: ScaleTransition(
                //         scale: Tween(
                //           begin: 0.0,
                //           end: 1.0
                //         ).animate(
                //           CurvedAnimation(
                //             parent: animationControllers[index], 
                //             curve: Curves.elasticOut
                //           )
                //         ),
                //         child: Container(
                //           color: widget.indicatorColor,
                //         ),
                //       )
                //     ), 
                //     GestureDetector(
                //       onTap: () {
                //         _changePageByTapView = true;
                //         setState(() {
                //           _selectTab(index);
                //         });

                //         pageController.animateToPage(
                //           index,
                //           duration: widget.changePageDuration,
                //           curve: widget.changePageCurve
                //         );
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //           color: itemBGColor,
                //         ),
                //         alignment: alignment,
                //         padding: const EdgeInsets.all(5),
                //         child: child,
                //       ),
                //     ),
                //     // Text(drawerListTile.title)
                    
                //   ],
                // );
                // return Container(
                //   color: Colors.red,
                //   width: 20,
                //   height: 30,
                //   margin: const EdgeInsets.only(top: 2),
                // );
              }
            ),
          ) 
        ],
      ),
    );
  }
}
 

 /*
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
    // BlocProvider.of<PageBloc>(context).add(LoadPageEvent(state.number));
    // BlocProvider.of<PageBloc>(context).add(const ClickTab("state.number"));
  }
 
 
  @override 
  Widget build(BuildContext context) {  
    return Material( 
      // elevation: widget.tabsElevation,
      // shadowColor: widget.tabsShadowColor,
      shape: const BeveledRectangleBorder(),
      // child: Container(
      //   color: Colors.yellow,
      //   child: BlocBuilder<PageBloc, PageState>(
      //     builder: (context, state){
      //       if(state is PageLoadedState){
      //         return Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               // Text("Activity: ${state.number}"),
      //               // const SizedBox(height: 30),
      //               ElevatedButton(
      //                 onPressed: () => BlocProvider.of<PageBloc>(context)
      //                   .add(LoadPageEvent(state.number)), 
      //                 child: const Icon(Icons.add),
      //               ),
      //             ],
      //           ),
      //         );
      //       }
      //       return Container(
      //         color: Colors.red,
      //       );
      //     }
      //   ),  
      // ),
 
      child: Column(
        children: [
          widget.drawerHeader as Widget,
          // drawerHeader,
          SizedBox(
            // width: widget.tabsWidth,
            width: 250,
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              // itemCount: widget.drawerTiles?.length,
              itemCount: 3,
              itemBuilder: (context, index){
                // Color itemBGColor =  widget.tabBackgroundColor;
                // Widget? child;
                // Alignment alignment = Alignment.centerLeft;
                // AppDrawerListTile drawerListTiles = widget.drawerTile![index];

                // if(drawerListTiles.child != null){
                //   child = drawerListTiles.child;
                // }

                // if(drawerListTiles != null){
                //   child = drawerListTiles;
                // } else {
                //   child = Container(
                //     padding: const EdgeInsets.all(8),
                //     color: widget.tabBackgroundColor,
                //     child: Row(
                //       children: [ 
                //         SizedBox(
                //           // width: widget.tabsWidth - 50,
                //           width: widget.tabsWidth,

                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: <Widget>[
                //               // SizedBox(height:20.0),
                //               AppExpansionTile(
                //                 title: drawerListTiles.title,
                //                 svgSrc: drawerListTiles.svgSrc, 
                //                 press: () {  },  
                //                 children: const <Widget>[ 
                //                   ListTile(
                //                     title: Text(
                //                       'All Videos',
                //                       // style: TextStyle(
                //                       //   color: Colors.white54
                //                       // ), 
                //                     ),
                //                     // horizontalTitleGap: 0.0,
                //                     contentPadding: EdgeInsets.only(
                //                       left: 54
                //                     ),
                //                   ),
                //                   ListTile(
                //                     title: Text(
                //                       'Add New Videos',
                //                       // style: TextStyle(
                //                       //   color: Colors.white54
                //                       // ), 
                //                     ),
                //                     contentPadding: EdgeInsets.only(
                //                       left: 54
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //         // (drawerListTiles.svgSrc != null) ?
                //         // Row(
                //         //   children: [
                //         //     Container(
                //         //       decoration: BoxDecoration(
                //         //         image: DecorationImage(
                //         //           image: AssetImage(drawerListTiles.svgSrc),
                //         //         )
                //         //       ),
                //         //     ),
                //         //     const SizedBox(
                //         //       width: 5,
                //         //     )
                //         //   ],
                //         // ): Container(),

                //         // (drawerListTiles.title != null) ? 
                //         // SizedBox(
                //         //   width: widget.tabsWidth - 50,
                //         //   child: Text(
                //         //     drawerListTiles.title,
                //         //     softWrap: true,
                //         //     style: _selectedIndex == index ?
                //         //       widget.selectedTabTextStyle :
                //         //       widget.tabTextStyle
                //         //   ),
                //         // ) : Container() 
                //       ],
                //     ),
                //   );
                // }

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
                        // decoration: BoxDecoration(
                        //   color: itemBGColor, 
                        // ),
                        // alignment: alignment,
                        padding: const EdgeInsets.all(5),
                        child: Container(),
                      ),
                    )
                  ]
                );
              }
            ),
          ),
        ],
      ) 
    );  
  }
} 
*/

