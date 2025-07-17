import 'package:flutter/material.dart';

class CurrentUserLocation extends StatelessWidget {
  const CurrentUserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Ubicación actual',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        Text(
          'New York, USA',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
