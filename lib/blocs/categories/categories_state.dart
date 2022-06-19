part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
  
  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoaded extends CategoriesState {  
  final List<CategoryModel?>? categories; 

  const CategoriesLoaded({this.categories});

  @override
  List<Object> get props => [categories!];

  @override
  String toString() => 'CategoriesLoaded  {categories: $categories}';
}
 
class CategoriesNotLoaded extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesIsEmpty extends CategoriesState {
  @override
  List<Object> get props => [];
}
