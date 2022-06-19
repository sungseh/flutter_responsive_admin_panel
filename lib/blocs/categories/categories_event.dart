part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}
  
class LoadCategories extends CategoriesEvent { 
  const LoadCategories();

  @override
  List<Object> get props => [];
}

class UpdateCategories extends CategoriesEvent { 
  final List<CategoryModel?>? categories; 

  const UpdateCategories(this.categories);

  @override
  List<Object> get props => [categories!]; 
}
