import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/controller/menu_controller.dart';
import 'package:flutter_responsive_admin_panel/view/screens/screens.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  int _pageIndex = 0;

  final List<String> titles = [
    'Dashboard',
    'Places',
    'Featured Places',
    'Upload Place',
    'Blogs',
    'Upload Blog',
    'States',
    'Notifications',
    'Users',
    'Admin',
    'Settings'
  ];
  
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

  final List<Widget> pages = [
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Dashboard"
        ),
      )
    ),
    Container(
      color: Colors.red,
      child: const Center(
        child: Text(
          "Presenters"
        ),
      )
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          "Audio"
        ),
      )
    ),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Videos"
        ),
      )
    ),
    Container(
      color: Colors.purple,
      child: const Center(
        child: Text(
          "Transactions"
        ),
      )
    ),
    Container(
      color: Colors.yellow,
      child: const Center(
        child: Text(
          "Dashboard"
        ),
      )
    ),
    // DataInfoPage(),
    // CoverWidget(
    //   widget: PlacesPage()
    // ),
    // CoverWidget(widget: FeaturedPlaces()),
    // CoverWidget(widget: UploadPlace()),
    // CoverWidget(widget: BlogPage()),
    // CoverWidget(widget: UploadBlog()),
    // CoverWidget(widget: States()),
    // CoverWidget(widget: Notifications()),
    // CoverWidget(widget: UsersPage()),
    // CoverWidget(widget: AdminPage()),
    // CoverWidget(widget: Settings())
  ];

  final List drawerListTiles = [
    AppDrawerListTile(
      title: "Dashboard",
      svgSrc: "assets/icons/menu_tran.svg",
      press: () {}, 
    ),
    AppDrawerListTile(
      title: "Presenters",
      svgSrc: "assets/icons/menu_tran.svg",
      press: () {},
    ),
    /*
    AppDrawerListTile(
      title: "List Presenters",
      svgSrc: "assets/icons/menu_tran.svg",
      press: () {},
      child: AppDrawerListTile(
        title: "Dashboard",
        svgSrc: "assets/icons/menu_tran.svg",
        press: () {},
      ), 
      children: [
        ListTile(
          // onTap: () => context.read<PageBloc>().add(LoadPageEvent(2)),
          // onTap: () => BlocProvider.of<PageBloc>(context)
          //   .add(LoadPageEvent(state.number)), 
          horizontalTitleGap: 16.0,
          leading: SvgPicture.asset( 
            "assets/icons/menu_tran.svg",
            color: Colors.white54,
            height: 16, 
          ),  
          title: const Text(
            "title",
            // style: const TextStyle(
            //   color: Colors.white54
            // ),
          ),
        ),
        AppDrawerListTile(
          title: "List Presenters",
          svgSrc: "assets/icons/menu_tran.svg",
          press: () {
            print("List Presentets");
          },
        ),
        AppDrawerListTile(
          title: "Add New Presenter",
          svgSrc: "assets/icons/menu_tran.svg",
          // press: () {},
          press: () {
            print("List Presentets");
          },
        ),
      ] 
    ),
    */
    AppDrawerListTile(
      title: "Audio",
      svgSrc: "assets/icons/menu_tran.svg",
      press: () {},
    ),
    AppDrawerListTile(
      title: "Videos",
      svgSrc: "assets/icons/menu_tran.svg",
      press: () {},
    ),
    AppDrawerListTile(
      title: "Categories",
      svgSrc: "assets/icons/menu_tran.svg",
      press: () {},
    ),
    AppDrawerListTile(
      title: "Settings",
      svgSrc: "assets/icons/menu_tran.svg",
      press: () {},
    ),
    AppDrawerListTile(
      title: "Task",
      svgSrc: "assets/icons/menu_task.svg",
      press: () {},
    ),
    // DrawerListTile(
    //   title: "Documents",
    //   svgSrc: "assets/icons/menu_dashboard.svg",
    //   press: () {},
    // ),
    AppDrawerListTile(
      title: "Store",
      svgSrc: "assets/icons/menu_store.svg",
      press: () {},
    ),
    AppDrawerListTile(
      title: "Notification",
      svgSrc: "assets/icons/menu_notification.svg",
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
                icon: Icon(LineIcons.user, color: Colors.grey[800], size: 20,),
                label: Text('Signed as ${ab.userType}', style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.deepPurpleAccent, fontSize: 16),),
                onPressed: () => null, 
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
      )   
    );
  }

  Tab tab(title, icon) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.only(left: 10,),
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon, size: 20, color: Colors.grey[800],
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

  DrawerHeader appDrawerHeader(){
    return DrawerHeader(
      child: Image.asset("assets/images/logo.png"),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value){
      context.read<AdministratorBloc>().getStates();
      context.read<AdministratorBloc>().getAdsData();
    }); 
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      // drawer: AppSideMenu(

      // ),
      body: SafeArea( 
        child: Column(
          children: <Widget>[
            const AppHeader(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: AppPageFrame(
                  tabBackgroundColor: Colors.white,
                  backgroundColor: Colors.grey[200],
                  tabsElevation: 0.5,
                  tabsShadowColor: Colors.grey[500],
                  tabsWidth: 200,
                  indicatorColor: Colors.deepPurpleAccent,
                  selectedTabBackgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
                  indicatorWidth: 5,
                  disabledChangePageFromContentView: true,
                  changePageDuration: const Duration(microseconds: 1),
                  initialIndex: _pageIndex,
                  drawerHeader: appDrawerHeader(),
                  // onPressed: _onClick,
                  sideMenu: AppSideMenu(
                    drawerHeader: appDrawerHeader(),
                    indicatorColor: Colors.deepPurpleAccent,
                    drawerTiles: <AppDrawerListTile>[
                      drawerListTiles[0], 
                      drawerListTiles[1], 
                      drawerListTiles[2], 
                      drawerListTiles[3], 
                      drawerListTiles[4],
                      drawerListTiles[5],
                      drawerListTiles[6],
                      drawerListTiles[7],
                      drawerListTiles[8],
                    ],
                  ), 
                  drawerTile: <AppDrawerListTile>[
                    drawerListTiles[0], 
                    drawerListTiles[1], 
                    drawerListTiles[2], 
                    drawerListTiles[3], 
                    drawerListTiles[4],
                    drawerListTiles[5],
                    drawerListTiles[6],
                    drawerListTiles[7],
                    drawerListTiles[8],
                  ],
                  tabs: <Tab>[
                    tab(titles[0], icons[0]),
                    tab(titles[1], icons[1]),
                    tab(titles[2], icons[2]),
                    tab(titles[3], icons[3]),
                    tab(titles[4], icons[4]),
                    tab(titles[5], icons[5]),
                    tab(titles[6], icons[6]),
                    tab(titles[7], icons[7]),
                    tab(titles[8], icons[8]),
                    tab(titles[9], icons[9]),
                    tab(titles[10], icons[10])
                  ], 
                  contents: pages
                ), 
              ),
            ),
          ],
        ), 



        // child: Row(
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
        // ),
      ),
    );
  }
}
