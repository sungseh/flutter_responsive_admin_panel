import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class PageControllerWidget extends StatefulWidget {
  const PageControllerWidget({Key? key}) : super(key: key);

  @override
  State<PageControllerWidget> createState() => _PageControllerWidgetState();
}

class _PageControllerWidgetState extends State<PageControllerWidget> {
  // final int _pageIndex = 0;
 
  final List icons = [
    LineIcons.pieChart,
    LineIcons.mapMarker,
    LineIcons.bomb,
    LineIcons.arrowCircleUp,
    LineIcons.rocket,
    LineIcons.arrowCircleUp,
    LineIcons.mapPin,
    LineIcons.bell,
    LineIcons.users,
    LineIcons.userSecret,
    LineIcons.key
  ];
  
  final List<AppDrawerListTile> drawerListTiles = [
    AppDrawerListTile(
      title: "Dashboard",
      icon: Icons.dashboard,
      press: () {}, 
    ),
    AppDrawerListTile(
      title: "Presenters",
      icon: Icons.person,
      press: () {},
    ), 
    AppDrawerListTile(
      title: "Audio",
      icon: Icons.audio_file,
      press: () {},
    ),
    AppDrawerListTile(
      title: "Videos",
      icon: Icons.video_file,
      press: () {},
    ),
    AppDrawerListTile(
      title: "Categories",
      icon: Icons.category,
      press: () {},
    ),
    AppDrawerListTile(
      title: "Users",
      icon: Icons.person,
      press: () {},
    ),
  ];


  Future handleLogOut() async{
    // final SharedPreferences sp = await SharedPreferences.getInstance();
    // await sp.clear().then((value) => nextScreenCloseOthers(context, SignInPage()));
  }


  Tab tab(title, icon) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon, size: 20, 
              color: Colors.grey[800],
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title, 
              style: TextStyle(
                fontSize: 14, 
                color: Colors.grey[900], 
                fontWeight: FontWeight.w600
              )
            )
          ],
        ),
      )
    );
  }
 
  AppDrawerListTile appHeaderListTile(String title, String icon){
    return AppDrawerListTile(
      title: title, 
      svgSrc: icon, 
      press: (){}
    );
  }

  Widget appDrawerHeader(){
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16
      ),
      child: DrawerHeader(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0)).then((value){
      context.read<AdministratorBloc>().getStates();
      context.read<AdministratorBloc>().getAdsData();
    }); 
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      drawer: const AppSideMenu(),
      body: SafeArea( 
        child: Column(
          children: <Widget>[
            const AppHeader(),
            Expanded(
              child: Container(
                // color: Colors.white,
                color: ConfigColors.bgColor,
                child: AppPageFrame( 
                  sideMenu: AppSideMenu(
                    drawerHeader: appDrawerHeader(),
                    indicatorColor: Colors.deepPurpleAccent,
                    drawerTiles: drawerListTiles.map((item){
                      return item;
                    }).toList() 
                  ),   
                ), 
              ),
            ),
          ],
        ), 
      ),
    );
  }
}
