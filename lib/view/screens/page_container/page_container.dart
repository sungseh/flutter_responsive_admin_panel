import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageControllerWidget extends StatefulWidget {
  const PageControllerWidget({Key? key}) : super(key: key);

  @override
  State<PageControllerWidget> createState() => _PageControllerWidgetState();
}

class _PageControllerWidgetState extends State<PageControllerWidget> {
  final int _pageIndex = 0;
 
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
    final SharedPreferences sp = await SharedPreferences.getInstance();
    // await sp.clear().then((value) => nextScreenCloseOthers(context, SignInPage()));
  }

  Widget _appBar (ab){
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        height: 60,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 10,
              offset: const Offset(0, 5)
            )
          ]
        ),
        child: Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 20, 
                  fontWeight: FontWeight.w700, 
                  color: Colors.deepPurpleAccent
                ),
                text: ConfigApplication.name,
                children: <TextSpan>[
                  TextSpan(
                    text: ' - Admin Panel',
                    style: GoogleFonts.poppins(
                      fontSize: 17, 
                      fontWeight: FontWeight.w400, 
                      color: Colors.grey[800]
                    )
                  )
                ]
              )
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[400]!,
                    blurRadius: 10,
                    offset: const Offset(2, 2)
                  )
                ] 
              ),
              child: TextButton.icon(
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  )
                ),
                icon: const Icon(
                  LineIcons.alternateSignOut, 
                  color: Colors.white, 
                  size: 20
                ),
                label: const Text(
                  'Logout', 
                  style: TextStyle(
                    fontWeight: FontWeight.w400, 
                    color: Colors.white, 
                    fontSize: 16
                  )
                ),
                onPressed: () => null, 
                // onPressed: () => handleLogOut(), 
              ),
            ),
            const SizedBox(width: 5,),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurpleAccent),
                borderRadius: BorderRadius.circular(20), 
              ),
              child: TextButton.icon(
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ))
                ),
                icon: Icon(
                  LineIcons.user, 
                  color: Colors.grey[800], 
                  size: 20
                ),
                label: Text(
                  'Signed as ${ab.userType}', 
                  style: const TextStyle(
                    fontWeight: FontWeight.w400, 
                    color: Colors.deepPurpleAccent, 
                    fontSize: 16
                  )
                ),
                onPressed: () => null, 
              ),
            ),
            const SizedBox(
              width: 20
            )
          ],
        ),
      )   
    );
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
