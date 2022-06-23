import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart'; 

enum IndicatorSide { start, end }

class AppVerticalTabs extends StatefulWidget {
  final int initialIndex;
  final double tabsWidth;
  final double indicatorWidth;
  final IndicatorSide? indicatorSide;
  final List<Tab>? tabs;
  final DrawerHeader? drawerHeader;
  final List<AppDrawerListTile>? menu;
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
 
  const AppVerticalTabs({
    Key? key,  
    this.initialIndex = 0,
    this.tabsWidth = 200, 
    this.indicatorWidth = 3,
    this.indicatorSide, 
    this.tabs, 
    this.drawerHeader,
    this.menu,
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
  }) : super(key: key);

  @override
  State<AppVerticalTabs> createState() => _AppVerticalTabsState();
}

class _AppVerticalTabsState extends State<AppVerticalTabs> with TickerProviderStateMixin {
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

    return Directionality(
      textDirection: widget.direction,
      child: Container(
        color: widget.backgroundColor ?? Theme.of(context).canvasColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Material(
                    elevation: widget.tabsElevation,
                    shadowColor: widget.tabsShadowColor,
                    shape: const BeveledRectangleBorder(),
                    child: SizedBox(
                      width: widget.tabsWidth,
                      child: ListView.builder(
                        itemCount: widget.tabs!.length,
                        itemBuilder: (context, index) {
                          Tab tab = widget.tabs![index];

                          Alignment alignment = Alignment.centerLeft;
                          if (widget.direction == TextDirection.rtl) {
                            alignment = Alignment.centerRight;
                          }

                          Widget? child;
                          if (tab.child != null) {
                            child = tab.child;
                          } else {
                            child = Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[ 
                                  (tab.icon != null)
                                  ? Row(
                                      children: <Widget>[
                                        tab.icon!,
                                        const SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    )
                                  : Container(),
                                  (tab.text != null)
                                  ? SizedBox(
                                      width: widget.tabsWidth - 50,
                                      child: Text(
                                        tab.text!,
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

                          Color itemBGColor = widget.tabBackgroundColor;

                          if (_selectedIndex == index) {
                            itemBGColor = widget.selectedTabBackgroundColor;
                          }

                          double? left, right;
                          if (widget.direction == TextDirection.rtl) {
                            left = (widget.indicatorSide == IndicatorSide.end)
                              ? 0
                              : null;
                            right = (widget.indicatorSide == IndicatorSide.start)
                              ? 0
                              : null;
                          } else {
                            left = (widget.indicatorSide == IndicatorSide.start)
                              ? 0
                              : null;
                            right = (widget.indicatorSide == IndicatorSide.end)
                              ? 0
                              : null;
                          }

                          return Stack(
                            children: <Widget>[
                              Positioned(
                                top: 2,
                                bottom: 2,
                                width: widget.indicatorWidth,
                                left: left,
                                right: right,
                                child: ScaleTransition(
                                  scale: Tween(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                      parent: animationControllers[index],
                                      curve: Curves.elasticOut,
                                    ),
                                  ),
                                  child: Container(
                                    color: widget.indicatorColor,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _changePageByTapView = true;
                                  setState(() {
                                    _selectTab(index);
                                  });

                                  pageController.animateToPage(
                                    index,
                                    duration: widget.changePageDuration,
                                    curve: widget.changePageCurve
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: itemBGColor,
                                  ),
                                  alignment: alignment,
                                  padding: const EdgeInsets.all(5),
                                  child: child,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}