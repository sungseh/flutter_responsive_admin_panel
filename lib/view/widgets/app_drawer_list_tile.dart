import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawerListTile extends StatelessWidget {
  final String title;
  final String svgSrc;
  final VoidCallback press;

  const AppDrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      // leading: Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(svgSrc)
      //     )
      //   ),
      // ),
      leading: SvgPicture.asset(
        svgSrc,
        // color: Colors.white54,
        height: 16,
      ),
      children: [
        ListTile(
          onTap: press,
          horizontalTitleGap: 0.0,
          leading: SvgPicture.asset(
            svgSrc,
            // color: Colors.white54,
            height: 16,
          ),
          title: Text(
            title,
            // style: const TextStyle(
            //   color: Colors.white54
            // ),
          ),
        ),

      ],

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