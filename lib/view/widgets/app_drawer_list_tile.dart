import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawerListTile extends StatelessWidget {
  final String title;
  final String? svgSrc;
  final IconData? icon;
  final VoidCallback press;
  final List<Widget> children;
  final Color? color;
  final Widget? child;

  const AppDrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    this.svgSrc,
    required this.press,
    this.children = const [], 
    this.icon,
    this.color,
    this.child, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    if (children.isEmpty) { 
      return ListTile(
        onTap: () => BlocProvider.of<PageBloc>(context).add(LoadPageNameEvent(title)), 
        horizontalTitleGap: 0.0,
        leading: icon != null ? Icon(
          icon ?? Icons.close, 
          color: color ?? ConfigColors.textColor,
        ) : svgSrc != null ?
        SvgPicture.asset(
          svgSrc!,
          color: color ?? ConfigColors.textColor,
          height: 16,
        ) : Container(), 
        title: Text(
          title,
          style: TextStyle(
            color: color ?? ConfigColors.textColor, 
          ),
        ),
      );
    } else {
      return ListTileTheme(
        dense: true,
        horizontalTitleGap: 0.0,
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(
              color: color ?? ConfigColors.textColor, 
            )
          ),
          leading: icon != null ? Icon(
            icon ?? Icons.close, 
            color: color ?? ConfigColors.textColor,
          ) : svgSrc != null ?
          SvgPicture.asset(
            svgSrc!,
            color: color ?? ConfigColors.textColor,
            height: 16,
          ) : Container(),
          children: children 
        )
      ); 
    } 
  }
}