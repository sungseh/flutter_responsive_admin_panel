import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PresentersList extends StatefulWidget {
  const PresentersList({Key? key}) : super(key: key);

  @override
  State<PresentersList> createState() => _PresentersListState();
}

class _PresentersListState extends State<PresentersList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Page Name: Presenters List"),
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