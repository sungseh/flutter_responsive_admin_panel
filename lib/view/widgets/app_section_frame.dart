import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/page/page_bloc.dart'; 

class AppSectionFrame extends StatefulWidget {
  // final String pageName;
  final Widget child;
 
  const AppSectionFrame({
    Key? key, 
    // required this.pageName, 
    required this.child
  }) : super(key: key);

  @override
  State<AppSectionFrame> createState() => _AppSectionFrameState();
}

class _AppSectionFrameState extends State<AppSectionFrame> {
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
              )
              // Text(
              //   pageName,
              //   style: const TextStyle(
              //     fontSize: 25, 
              //     fontWeight: FontWeight.w700
              //   ),
              // ),
              // sortingPopup()
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 10),
            height: 3,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(15)
            ),
          ),
          
          widget.child
        ],
      ),
    );
  }
} 