import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {   
  Widget _buildDashboard1(){
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.red, 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Page Name: Dashboard")
          ],
        ),
      ),
    );
  }

  Widget _buildDashboard(){ 
    return Container(
      // padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05, top: w * 0.05),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[ 
              AppCard('TOTAL USERS', 10), 

              AppCard('TOTAL USERS', 10),

              AppCard('TOTAL USERS', 10), 
              
              AppCard('TOTAL USERS', 10), 
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: <Widget>[
          //     FutureBuilder(
          //       future: notifications,
          //       builder: (BuildContext context, AsyncSnapshot snap) {
          //         if (!snap.hasData) return card('TOTAL NOTIFICATIONS', 0);
          //         if (snap.hasError) return card('TOTAL NOTIFICATIONS', 0);
          //         return card('TOTAL NOTIFICATIONS', snap.data);
          //       },
          //     ),

          //     const SizedBox(
          //       width: 20,
          //     ),

          //     StreamBuilder(
          //       stream: FirebaseFirestore.instance.collection('featured').doc('featured_list').snapshots(),
          //       builder: (context, AsyncSnapshot snap) {
          //         if (!snap.hasData) return card('FEATURED ITEMS', 0);
          //         if (snap.hasError) return card('FEATURED ITEMS', 0);
          //         return card('FEATURED ITEMS', snap.data['places'].length);
          //       },
          //     ),

          //     const SizedBox(
          //       width: 20,
          //     ),
          //     FutureBuilder(
          //       future: states,
          //       builder: (BuildContext context, AsyncSnapshot snap) {
          //         if (!snap.hasData) return card('TOTAL STATES', 0);
          //         if (snap.hasError) return card('TOTAL STATES', 0);
          //         return card('TOTAL STATES', snap.data);
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
    
  @override
  Widget build(BuildContext context) {
    return AppSectionFrame(
      hasAddSection: false,
      listSection: _buildDashboard(),
      addSection: Container() 
    );
  }
}








/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart'; 

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> { 
  Future? users;
  Future? places;
  Future? blogs;
  Future? notifications;
  Future? states;

  @override
  void initState() {
    super.initState();
    users = context.read<AdminBloc>().getTotalDocuments('users_count');
    places = context.read<AdminBloc>().getTotalDocuments('places_count');
    blogs = context.read<AdminBloc>().getTotalDocuments('blogs_count');
    notifications = context.read<AdminBloc>().getTotalDocuments('notifications_count');
    states = context.read<AdminBloc>().getTotalDocuments('states_count');
  }
 
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05, top: w * 0.05),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                future: users,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (!snap.hasData) return card('TOTAL USERS', 0);
                  if (snap.hasError) return card('TOTAL USERS', 0);
                  return card('TOTAL USERS', snap.data);
                },
              ),
              const SizedBox(
                width: 20,
              ),
              FutureBuilder(
                future: places,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (!snap.hasData) return card('TOTAL PLACES', 0);
                  if (snap.hasError) return card('TOTAL PLACES', 0);
                  return card('TOTAL PLACES', snap.data);
                },
              ),
              const SizedBox(
                width: 20,
              ),
              FutureBuilder(
                future: blogs,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (!snap.hasData) return card('TOTAL BLOGS', 0);
                  if (snap.hasError) return card('TOTAL BLOGS', 0);
                  return card('TOTAL BLOGS', snap.data);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                future: notifications,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (!snap.hasData) return card('TOTAL NOTIFICATIONS', 0);
                  if (snap.hasError) return card('TOTAL NOTIFICATIONS', 0);
                  return card('TOTAL NOTIFICATIONS', snap.data);
                },
              ),

              const SizedBox(
                width: 20,
              ),

              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('featured').doc('featured_list').snapshots(),
                builder: (context, AsyncSnapshot snap) {
                  if (!snap.hasData) return card('FEATURED ITEMS', 0);
                  if (snap.hasError) return card('FEATURED ITEMS', 0);
                  return card('FEATURED ITEMS', snap.data['places'].length);
                },
              ),

              const SizedBox(
                width: 20,
              ),
              FutureBuilder(
                future: states,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (!snap.hasData) return card('TOTAL STATES', 0);
                  if (snap.hasError) return card('TOTAL STATES', 0);
                  return card('TOTAL STATES', snap.data);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget card(String title, int? number) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: 180,
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[300]!, 
            blurRadius: 10, 
            offset: const Offset(3, 3)
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            height: 2,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(15)
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.trending_up,
                size: 40,
                color: Colors.deepPurpleAccent,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}




*/