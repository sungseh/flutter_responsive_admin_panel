import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawerListTile extends StatelessWidget {
  final String title;
  final String? svgSrc;
  final Widget? icon;
  final VoidCallback press;
  final List<Widget> children;
  final Widget? child;

  const AppDrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    this.svgSrc,
    required this.press,
    this.children = const [], 
    this.child, 
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) { 
      return ListTile(
        // onTap: press,
        onTap: () => BlocProvider.of<PageBloc>(context)
          .add(LoadPageNameEvent(title)), 
        horizontalTitleGap: 0.0,
        leading: icon ?? (svgSrc != null ?
          SvgPicture.asset(
            svgSrc!,
            // color: Colors.white54,
            height: 16,
          ) : Container()
        ),  
        title: Text(
          title,
          // style: const TextStyle(
          //   color: Colors.white54
          // ),
        ),
      );
    } else {
      return ListTileTheme(
        // contentPadding: EdgeInsets.all(0),
        dense: true,
        horizontalTitleGap: 0.0,
        // minLeadingWidth: 0,
        child: ExpansionTile(
          title: Text(title), 
          // tilePadding: EdgeInsets.zero,

          // leading: Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(svgSrc)
          //     )
          //   ),
          // ),
          leading: icon ?? (svgSrc != null ?
            SvgPicture.asset(
              svgSrc!,
              // color: Colors.white54,
              height: 16,
            ) : Container()
          ), 
          children: children
          // children: [
          //   ListTile(
          //     onTap: press,
          //     horizontalTitleGap: 0.0,
          //     leading: SvgPicture.asset(
          //       svgSrc!,
          //       // color: Colors.white54,
          //       height: 16,
          //     ),
          //     title: Text(
          //       title,
          //       // style: const TextStyle(
          //       //   color: Colors.white54
          //       // ),
          //     ),
          //   ),
          // ],
        )
      );
 
      // return ListTile(
      //   onTap: press,
      //   horizontalTitleGap: 0.0,
      //   leading: SvgPicture.asset(
      //     svgSrc,
      //     // color: Colors.white54,
      //     height: 16,
      //   ),
      //   title: Text(
      //     title,
      //     // style: const TextStyle(
      //     //   color: Colors.white54
      //     // ),
      //   ),
      // );

    }

    
  }
}