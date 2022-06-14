import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/page/page_bloc.dart'; 

class AppSectionFrame extends StatefulWidget {
  // final String pageName;
  final void Function()? onPressed;
  final Widget listSection;
  final Widget addSection;
 
  const AppSectionFrame({
    Key? key, 
    // required this.pageName, 
    this.onPressed,
    required this.listSection, 
    required this.addSection, 
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
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<PageBloc, PageState>(
                builder: (context, state) { 
                  if (state is PageNameLoadedState) {
                    return Text(
                      state.pageName,
                      style: const TextStyle(
                        fontSize: 25, 
                        fontWeight: FontWeight.w700
                      ),
                    ); 
                  }
                  return Container();
                }
              ),
              ElevatedButton(
                // onPressed: widget.onPressed,
                onPressed: _onPressedAdd,
                child: Row(
                  children: const [
                    Icon(Icons.add),
                    Text(
                      "Add"
                    ),
                  ],
                )
              ),
              // sortingPopup()
            ],
          ),
          const Divider(
            thickness: 2,  
            color: Colors.indigoAccent,
            height: 25,  
          ),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  // height: 200,
                  // width: 200,
                  color: Colors.blue,
                  // child: widget.listSection
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, int index) {
                      return Container(
                        margin: const EdgeInsets.all(2),
                        color: Colors.green,
                        height: 60,
                        width: 60,
                      );
                      
                    }
                  ),
                ),
              ),
              Visibility(
                visible: _showAddSection,
                child: Expanded(
                  flex: 1,
                  child: widget.addSection
                )
              )
            ],
          )
          
          
          // widget.listSection,
 
          // Visibility(
          //   visible: _showAddSection,
          //   child: widget.addSection
          // )

          
        ],
      ),
    );
  }
} 