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
    _categoriesBloc.add(const LoadCategories()); 
    super.initState();
  }

  _onTapAdd(CategoryModel? item) {
  }

  _onTapCategory(CategoryModel? item) {
    // Navigator.pushNamed(
    //   context,
    //   Routes.categoryPlayer,
    //   arguments: item
    // );
  }

  Widget _buildCategories(){
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) { 
        if (state is CategoriesLoaded) {
          List<CategoryModel?>? categories = state.categories;  

          if(categories!.isEmpty){
            return const AppEmptyContent(
              title: "No Categories",
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

        return Container();
      }
    ); 
  }
 
  Widget _buildCategoriess(){ 
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) { 
        if (state is CategoriesLoaded) {
          List<CategoryModel?>? categories = state.categories;  

          if(categories!.isEmpty){
            return const AppEmptyContent(
              title: "No Categories",
              subtitle: "No data available. Upload first!"
            );
          }
        }

        return Container();
      }
    );
  }

  Widget _buildCategory(){
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) { 
        if (state is CategoriesLoaded) { 
          List<CategoryModel?>? categories = state.categories; 

          if(categories!.isEmpty){
            return const AppEmptyContent(
              title: "No Categories",
              subtitle: "No data available.\nUpload first!"
            );
          }
  
          return Column(
            children: categories.map((item) {
              return Container( 
                color: const Color.fromARGB(83, 196, 196, 196),
                padding: const EdgeInsets.only(top: 2), 
                // child: Container(
                //   height: 30,
                //   width: 30,
                //   color: Colors.red,
                //   margin: EdgeInsets.all(4),
                // ),
                child: AppCategoryItem( 
                  // onPressed: _onTapCategory, 
                  item: item!,
                  // type: CategoryViewType.category,
                ),
              );
            }).toList(),
          );
 
          // return GridView.count(
          //   padding: const EdgeInsets.only(
          //     left: 8, 
          //     right: 8, 
          //     top: 8
          //   ), 
          //   mainAxisSpacing: 8,
          //   crossAxisSpacing: 8,
          //   crossAxisCount: 2,
          //   // childAspectRatio: ratio,
          //   shrinkWrap: true, 
          //   children: categories.map((item) { 
          //     return AppCategoryItem(
          //       onPressed: _onTapCategory,   
          //       item: item,
          //       type: CategoryViewType.recent,
          //     );
          //   }).toList(),
          // ); 
        }

        return GridView.builder(
          padding: const EdgeInsets.only(
            left: 8, 
            right: 8, 
            top: 8
          ), 
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true, 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 8,
          itemBuilder: (context, index) { 
            // return const AppVideoItem(
            return const AppCategoryItem(
              item: null,
              // type: VideoViewType.grid,
            ); 
          },
        ); 
      },
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return AppSectionFrame(
      listSection: _buildCategories(),
      addSection: const AddCategory()
      // addSection: Container(
      //   height: 200,
      //   width: 200,
      //   margin: EdgeInsets.symmetric(horizontal: 8),
      //   color: Colors.red,
      // ),
    );
  }
}