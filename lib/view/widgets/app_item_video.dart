import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';  
import 'package:line_icons/line_icons.dart';

class AppVideoItem extends StatelessWidget {
  final VideoModel? item;

  const AppVideoItem({
    Key? key, 
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
     return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      decoration: BoxDecoration(
        color: ConfigColors.itemColor, 
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: <Widget>[ 
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: ConfigColors.itemColor,
              borderRadius: BorderRadius.circular(10)
            ), 
            child: AppCustomImage(
              image: item!.thumbnail!,
              radius: 0,
            ), 
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                //top: 15,
                left: 15,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppTitleFont(
                        title: item?.title,
                      ),
                      AppSubTitleFont(
                        title: item?.presenter,
                      ),    
                      AppBodyFont(
                        title: item?.category,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              //top: 15,
              left: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[  
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        height: 35,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 16, color: Colors.grey[800]
                        )
                      ),
                      onTap: () {
                        // nextScreen(context, UpdatePlace(placeData: d));
                      },
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      child: Container(
                        height: 35,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(
                          Icons.delete,
                          size: 16, 
                          color: Colors.grey[800]
                        )
                      ),
                      onTap: () {
                        // handleDelete(d.timestamp);
                      },
                    ),
                    const SizedBox(width: 10), 
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}