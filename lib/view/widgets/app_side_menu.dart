import 'package:flutter/material.dart'; 
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';


class AppSideMenu extends StatefulWidget {
  final int initialIndex;
  final double tabsWidth; 
  final DrawerHeader? drawerHeader;
  final List<AppDrawerListTile>? drawerTiles;
  final TextDirection direction;
  final Color indicatorColor;
  final bool disabledChangePageFromContentView;
  final Color selectedTabBackgroundColor;
  final Color tabBackgroundColor;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final Duration changePageDuration;
  final Curve changePageCurve; 
  final Function(int? tabIndex)? onSelect; 

 
  const AppSideMenu({
    Key? key,  
    this.initialIndex = 0,
    this.tabsWidth = 200,  
    this.drawerHeader,
    this.drawerTiles,
    this.direction = TextDirection.ltr,
    this.indicatorColor = Colors.green,
    this.disabledChangePageFromContentView = false,
    this.selectedTabBackgroundColor = const Color(0x1100ff00),
    this.tabBackgroundColor = const Color(0xfff8f8f8),
    this.selectedTabTextStyle = const TextStyle(color: Colors.black),
    this.tabTextStyle = const TextStyle(color: Colors.black38), 
    this.changePageDuration = const Duration(milliseconds: 300), 
    this.changePageCurve = Curves.easeInOut,  
    this.onSelect,  
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
                              drawerListTile.icon ?? const Icon(Icons.close),
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
              }
            ),
          ) 
        ],
      ),
    );
  }
} 