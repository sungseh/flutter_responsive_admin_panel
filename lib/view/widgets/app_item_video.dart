import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';  
import 'package:line_icons/line_icons.dart';

class AppVideoItem extends StatelessWidget {
  final VideoModel item;

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
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10)
            ),
            // TODO: Change this
            // child: CustomCacheImage(
            //   imageUrl: d.imageUrl1, 
            //   radius: 10
            // ),
            child: Container(),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                //top: 15,
                left: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        LineIcons.mapMarker, 
                        size: 15, 
                        color: Colors.grey
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        // d.location!,
                        item.presenter!,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.access_time, 
                        size: 15, 
                        color: Colors.grey
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        // d.date!, 
                        item.title!, 
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.grey,
                            ),
                            Text(
                              // d.loves.toString(), 
                              item.category!, 
                              style: const TextStyle(
                                color: Colors.grey, 
                                fontSize: 13
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        child: Container(
                        height: 35,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                              size: 16,
                              color: Colors.grey[800],
                            ),
                            Text(
                              item.videoId!,
                              style: const TextStyle(
                                color: Colors.grey, 
                                fontSize: 13
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        // navigateToReviewPage(context, d.timestamp, d.name);
                      },
                    ),
                      const SizedBox(
                        width: 10,
                      ),
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
                      Container(
                        height: 35,
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(
                            color: Colors.grey[300]!
                          ),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: TextButton.icon(
                          // onPressed: () => openFeaturedDialog(d.timestamp),
                          // onPressed: () => openFeaturedDialog(item.documentId),
                          onPressed: () {},
                          icon: const Icon(LineIcons.plus),
                          label: const Text('Add to Featured')
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );  
  }
}