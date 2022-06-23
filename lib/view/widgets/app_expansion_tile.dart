import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppExpansionTile extends StatelessWidget {
  final String title;
  final String svgSrc;
  final VoidCallback press;
  final List<Widget>? children;

  const AppExpansionTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    this.children
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      // color: ConfigColors.bgColor,
      child: ExpansionTile(
        backgroundColor: Colors.yellow,
        leading: SvgPicture.asset(
          svgSrc,
          // color: Colors.white54,
          height: 16,
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Text(
          title,
          // style: const TextStyle(
          //   color: Colors.white54
          // ), 
          // style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        tilePadding: const EdgeInsets.all(0),
        childrenPadding: const EdgeInsets.all(0), 
        expandedAlignment: Alignment.centerLeft,
        children: children ?? [],
        // children: const <Widget>[ 
        //   ListTile(
        //     title: Text(
        //       'All Videos',
        //       style: TextStyle(
        //         color: Colors.white54
        //       ), 
        //     ),
        //     // horizontalTitleGap: 0.0,
        //     contentPadding: EdgeInsets.only(
        //       left: 54
        //     ),
        //   ),
        //   ListTile(
        //     title: Text(
        //       'Add New Videos',
        //       style: TextStyle(
        //         color: Colors.white54
        //       ), 
        //     ),
        //     contentPadding: EdgeInsets.only(
        //       left: 54
        //     ),
        //   ),
        // ],
      ),
    ); 
  }
}



