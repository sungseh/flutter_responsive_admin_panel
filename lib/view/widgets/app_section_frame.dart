
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/page/page_bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/config_colors.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/app_button.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/app_empty_content.dart'; 

class AppSectionFrame extends StatefulWidget {
  // final String pageName;
  final void Function()? onPressed;
  final Widget? listSection;
  final Widget? addSection;
  final bool hasAddSection;
 
  const AppSectionFrame({
    Key? key, 
    // required this.pageName, 
    this.onPressed,
    required this.listSection, 
    required this.addSection, 
    this.hasAddSection = true
  }) : super(key: key);

  @override
  State<AppSectionFrame> createState() => _AppSectionFrameState();
}

class _AppSectionFrameState extends State<AppSectionFrame> {
  bool _showAddSection = false;

  _onPressedAdd(){
    setState(() {
      _showAddSection = !_showAddSection;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.05,
            // ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<PageBloc, PageState>(
                  builder: (context, state) { 
                    if (state is PageNameLoadedState) {
                      return Text(
                        state.pageName,
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w800,
                          color: ConfigColors.textColor
                        ),
                      ); 
                    }
                    return Container();
                  }
                ), 
                if(widget.hasAddSection) AppButton(
                  title: "Add",
                  onPressed: _onPressedAdd,
                ), 
                // sortingPopup()
              ],
            ),
            Divider(
              thickness: 2,  
              color: Theme.of(context).primaryColor,
              height: 24,  
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: widget.listSection ?? const AppEmptyContent(title: "This has not been given")
                ),
                Visibility(
                  visible: _showAddSection,
                  child: Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: widget.addSection ?? const AppEmptyContent(title: "This has not been given")
                    )
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
} 