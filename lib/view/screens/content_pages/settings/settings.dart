import 'package:flutter/material.dart';

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
          children: const [
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