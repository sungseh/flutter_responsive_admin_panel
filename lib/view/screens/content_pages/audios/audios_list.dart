import 'package:flutter/material.dart';  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/misc/misc.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '../../../../models/models.dart';

// class AudiosList extends StatelessWidget {
//   const AudiosList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Text("Page Name: ${state.pageName}"),
//             Text("Page Name: Audios List"),
//             // const SizedBox(height: 30),
//             // ElevatedButton(
//             //   onPressed: () => BlocProvider.of<PageBloc>(context)
//             //     .add(LoadPageEvent(state.number)), 
//             //   child: const Icon(Icons.add),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class AudiosList extends StatefulWidget {
  const AudiosList({Key? key}) : super(key: key);

  @override
  State<AudiosList> createState() => _AudiosListState();
}
 
class _AudiosListState extends State<AudiosList>{ 
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  ScrollController? controller;
  DocumentSnapshot? _lastVisible;
  late bool _isLoading;
  // List<DocumentSnapshot> _snap = [];
  final List<DocumentSnapshot> _snap = [];
  List<AudioModel> _data = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String collectionName = 'audios';
 
  // BlocProvider.of<PageBloc>(context);



  late bool _descending;
  late String _orderBy;
  String? _sortByText;
  bool? _hasData;

  @override
  void initState() {
    controller = ScrollController()..addListener(_scrollListener);
    super.initState();
    _isLoading = true;
    _sortByText = 'Newest First';
    _orderBy = 'timestamp';
    _descending = true;
    if(mounted){
      _getData();
    }
  }
 
  Future<void> _getData() async {
    QuerySnapshot data;
    if (_lastVisible == null) {
      data = await firestore
        .collection(collectionName)
        .orderBy(_orderBy, descending: _descending)
        .limit(10)
        .get();
    } else {
      data = await firestore
        .collection(collectionName)
        .orderBy(_orderBy, descending: _descending)
        .startAfter([_lastVisible![_orderBy]])
        .limit(10)
        .get();
    }

    // if (data.docs.length > 0) {
    if (data.docs.isNotEmpty) {
      _lastVisible = data.docs[data.docs.length - 1];
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasData = true;
          _snap.addAll(data.docs);
          _data = _snap.map((e) => AudioModel.fromFirestore(e)).toList();
        });
      }
    } else {
      if(_lastVisible == null){
        setState(() {
          _isLoading = false;
          _hasData = false; 
        });
      }else{
        setState(() {
          _isLoading = false;
          _hasData = true;
        });
        openToast(context, 'No more content available');
      }
    }
    return null;
  }
 
  refreshData () {
    setState(() {
      _isLoading = true;
      _snap.clear();
      _data.clear();
      _lastVisible = null;
    });
    _getData();
  }
 
  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }
 
  void _scrollListener() {
    if (!_isLoading) {
      if (controller!.position.pixels == controller!.position.maxScrollExtent) {
        setState(() => _isLoading = true);
        _getData();
      }
    }
  }

  // navigateToReviewPage(context, timestamp, name) {
  //   nextScreenPopuup(context, CommentsPage(collectionName: collectionName, timestamp: timestamp, title: name,));
  // }
 
  handleDelete(timestamp) {
    final AdministratorBloc ab = Provider.of<AdministratorBloc>(context, listen: false); 
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(50),
          elevation: 0,
          children: <Widget>[
            const Text(
              'Delete?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900
              )
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Want to delete this item from the database?',
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,
                fontWeight: FontWeight.w700
              )
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                children: <Widget>[
                  TextButton(
                    // style: buttonStyle(Colors.redAccent),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    onPressed: ()async{
                      if (ab.userType == 'tester') {
                        Navigator.pop(context);
                        openDialog(
                          context,
                          'You are a Tester', 'Only admin can delete contents'
                        );
                      } else {
                        await ab.deleteContent(timestamp, collectionName)
                          .then((value) => ab.removefromFeaturedList(context, timestamp))
                          .then((value) => ab.decreaseCount('places_count'));
                        refreshData();
                        Navigator.pop(context);
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    // style: buttonStyle(Colors.deepPurpleAccent),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            )
          ],
        );
      }
    );
  }
 
  openFeaturedDialog (String? timestamp) {
    final AdministratorBloc ab = Provider.of<AdministratorBloc>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(50),
          elevation: 0,
          children: <Widget>[
            const Text(
              'Add to Featured',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900
              )
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Do you Want to add this item to the featured list?',
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,
                fontWeight: FontWeight.w700
              )
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                children: <Widget>[
                  TextButton(
                    // style: buttonStyle(Colors.redAccent),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    onPressed: () async {
                      if (ab.userType == 'tester') {
                        Navigator.pop(context);
                        openDialog(context, 'You are a Tester', 'Only admin can do this');
                      } else {
                        await context.read<AdministratorBloc>().getFeaturedList().then((List featuredList)async{
                          if(featuredList.length <= 10){
                            await context.read<AdministratorBloc>().addToFeaturedList(context, timestamp);
                            Navigator.pop(context);
                          } else {
                            Navigator.pop(context);
                            openDialog(context, 'Fetured items are greater than 10 contents!', 'The limit of featured item is 10. Please remove some items from featured contents and try again');
                          }
                        });
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    // style: buttonStyle(Colors.deepPurpleAccent),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            )
          ],
        );
      }
    );
  }
   
  Widget dataList(AudioModel d) {
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
                        // d.name!,
                        d.title!,
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
                      const Icon(LineIcons.mapMarker, size: 15, color: Colors.grey),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        // d.location!,
                        d.presenter!,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.access_time, size: 15, color: Colors.grey),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        // d.date!,
                        d.category!,
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
                              d.duration.toString(),
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
                              d.duration.toString(),
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
                          onPressed: () => openFeaturedDialog(d.documentId),
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
 
  Widget sortingPopup (){
    return PopupMenuButton(
      child: Container(
        height: 40,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(30)
        ),
        child : Row(
          children: [
            Icon(CupertinoIcons.sort_down, color: Colors.grey[800],),
            const SizedBox(width: 10,),
            Text(
              'Sort By - $_sortByText', 
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.w500
              )
            )
          ],
        )
      ),
      itemBuilder: (BuildContext context){
        return <PopupMenuItem>[
          const PopupMenuItem(
            value: 'new',
            child: Text('Newest First'),
          ),
          const PopupMenuItem(
            value: 'old',
            child: Text('Oldest First'),
          ),
          const PopupMenuItem(
            value: 'popular',
            child: Text('Most Popular'),
          ),
          const PopupMenuItem(
            value: 'comments',
            child: Text('Most Commented'),
          ),
        ];
      },
      onSelected: (dynamic value){
        if(value == 'new'){
          setState(() {
            _sortByText = 'Newest First';
            _orderBy = 'timestamp';
            _descending = true;
          });
        }else if(value == 'old'){
          setState(() {
            _sortByText = 'Oldest First';
            _orderBy = 'timestamp';
            _descending = false;
          });
        }else if(value == 'popular'){
          setState(() {
            _sortByText = 'Most Popular';
            _orderBy = 'loves';
            _descending = true;
          });
        }else if(value == 'comments'){
          setState(() {
            _sortByText = 'Most Commented';
            _orderBy = 'comments count';
            _descending = true;
          });
        }
        refreshData();
      },
    );
  }

  @override
  Widget build(BuildContext context) { 
    return AppSectionFrame(
      child: Expanded(
        child: _hasData == false 
        ? const AppEmptyPage(
            icon: Icons.content_paste, 
            message: 'No data available.\nUpload first!'
        )
        : RefreshIndicator(
            onRefresh: () async { 
              refreshData();
            },
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              controller: controller,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: _data.length + 1,
              itemBuilder: (_, int index) {
                if (index < _data.length) {
                  return dataList(_data[index]);
                }
                return Center(
                  child: Opacity(
                    opacity: _isLoading ? 1.0 : 0.0,
                    child: const SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: CircularProgressIndicator()
                    ),
                  ),
                );
              },
            ),
        ),
      ),
    ); 
  } 
}  