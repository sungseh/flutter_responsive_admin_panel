import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  // final AudioFirestore? _audiosRepo;
  // StreamSubscription? _audiosSub;  

  final FirebaseFirestore firestore = FirebaseFirestore.instance;



  AdminBloc() : super(AdminInitial()) {
    on<AdminEvent>((event, emit) {
      // on<LoadAds>(_onLoadAds);
      // on<UpdateAudios>(_onUpdateAudios);
    });
  }
   
}
  