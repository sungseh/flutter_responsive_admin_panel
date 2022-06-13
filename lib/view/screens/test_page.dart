import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';

class Test extends StatefulWidget {
  final int num;
  const Test({
    Key? key, 
    required this.num
  }) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // var numm = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestBloc()..add(LoadTestEvent(widget.num)),
      // create: (context) => TestBloc()..add(InitTestEvent()),
    // _audiosBloc = BlocProvider.of<AudiosBloc>(context);

      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc Increment"),
        ),
        body: BlocBuilder<TestBloc, TestState>(
          builder: (context, state){
            if(state is TestLoadedState){
              return Center(
                child: Column(
                  children: [
                    Text("Activity: ${state.number}"),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<TestBloc>(context)
                        .add(LoadTestEvent(state.number)), 
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              );
            }
            return Container(
              color: Colors.red,
            );
          }
        ),
      ),
    );
  }
}