import 'package:flutter/material.dart';

class LoadingStatus extends StatelessWidget {
  const LoadingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),

        child: const Padding(
          padding: EdgeInsets.all(10),
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
