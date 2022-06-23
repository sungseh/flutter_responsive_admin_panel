part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}
  
class LoadCategoriesEvent extends CategoriesEvent { 
  const LoadCategoriesEvent();

  @override
  List<Object> get props => [];
}

class UpdateCategoriesEvent extends CategoriesEvent { 
  final List<CategoryModel?>? categories; 

  const UpdateCategoriesEvent(this.categories);

  @override
  List<Object> get props => [categories!]; 
}
