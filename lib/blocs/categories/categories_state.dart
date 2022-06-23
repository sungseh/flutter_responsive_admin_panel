part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
  
  @override
  List<Object> get props => [];
}

class CategoriesInitialState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoadedState extends CategoriesState {  
  final List<CategoryModel?>? categories; 

  const CategoriesLoadedState({this.categories});

  @override
  List<Object> get props => [categories!];

  @override
  String toString() => 'CategoriesLoaded  {categories: $categories}';
}
 
class CategoriesNotLoadedState extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesIsEmptyState extends CategoriesState {
  @override
  List<Object> get props => [];
}
