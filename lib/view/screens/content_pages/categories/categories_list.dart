import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) { 
    return Container(
      color: Colors.pink,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Page Name: ${state.pageName}"),
            Text("Page Name: Categories List"),
            // const SizedBox(height: 30),
            // ElevatedButton(
            //   onPressed: () => BlocProvider.of<PageBloc>(context)
            //     .add(LoadPageEvent(state.number)), 
            //   child: const Icon(Icons.add),
            // ),
          ],
        ),
      ),
    );
  }
}