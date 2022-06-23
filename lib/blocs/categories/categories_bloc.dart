import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/repositories/repositories.dart';

part 'categories_event.dart';
part 'categories_state.dart';
  
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> { 
  final CategoryFirestore? _categoriesRepo;
  StreamSubscription? _categoriesSub;  

  CategoriesBloc({ 
    required CategoryFirestore? categoriesRepo
  }) : 
  assert(categoriesRepo != null),
  _categoriesRepo = categoriesRepo,
  super(CategoriesLoadingState()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<UpdateCategoriesEvent>(_onUpdateCategories);
  }

  void _onLoadCategories(LoadCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoadingState());
    _categoriesSub?.cancel();
    _categoriesSub = _categoriesRepo?.categories()
      .listen((categories) => add(UpdateCategoriesEvent(categories))); 
  }

  void _onUpdateCategories(UpdateCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoadedState( 
      categories: event.categories, 
    ));
  }
}

 
