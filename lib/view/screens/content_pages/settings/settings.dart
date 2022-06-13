import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Page Name: Settings"),
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