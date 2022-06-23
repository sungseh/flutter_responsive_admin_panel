import 'package:flutter/material.dart';

class AppLoadingScreen extends StatelessWidget {
  final bool isLoading;
  
  const AppLoadingScreen({
    Key? key, 
    required this.isLoading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: isLoading ? 1.0 : 0.0,
        child: const SizedBox(
          width: 32.0,
          height: 32.0,
          child: CircularProgressIndicator()
        ),
      ),
    );
    
  }
}