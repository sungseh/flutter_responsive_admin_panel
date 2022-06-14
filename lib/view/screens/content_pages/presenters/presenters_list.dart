import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/misc/dialog.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/app_loading_screen.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PresentersList extends StatefulWidget {
  const PresentersList({Key? key}) : super(key: key);

  @override
  State<PresentersList> createState() => _PresentersListState();
}

class _PresentersListState extends State<PresentersList> { 
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  ScrollController? controller;
  DocumentSnapshot? _lastVisible;
  late bool _isLoading;
  // List<DocumentSnapshot> _snap = [];
  final List<DocumentSnapshot> _snap = [];
  List<PresenterModel> _data = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String collectionName = 'teachers'; 
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
          _data = _snap.map((e) => PresenterModel.fromFirestore(e)).toList();
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
    return;
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
            Icon(
              CupertinoIcons.sort_down, 
              color: Colors.grey[800]
            ),
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
                  return AppPresenterItem(
                    item: _data[index]
                  );
                }
                return AppLoadingScreen(
                  isLoading: _isLoading
                );
              },
            ),
        ),
      ),
    ); 
  } 
}  