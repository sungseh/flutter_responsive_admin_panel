import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

import '../../../../blocs/categories/categories_bloc.dart';
import 'categories_add.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  late CategoriesBloc _categoriesBloc;

  @override
  void initState() {
    _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    // _categoriesBloc.add(const LoadCategories()); 
    super.initState();
  }
 
  Widget _buildCategories(){
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is! CategoriesLoadedState) {
          _categoriesBloc.add(const LoadCategoriesEvent());
        
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (_, int index){
              return const AppVideoItem(item: null);
            }
          );
        } else {
          List<CategoryModel?>? categories = state.categories; 

          if(categories!.isEmpty){
            return const AppEmptyContent(
              title: "No Category",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (_, int index) {
                return AppCategoryItem( 
                  item: categories[index]!,
                );
              }
            );
          }
        }
      }
    ); 
  }  
   

  @override
  Widget build(BuildContext context) {
    return AppSectionFrame(
      listSection: _buildCategories(),
      addSection: const AddCategory() 
    );
  }
}