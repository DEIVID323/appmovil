import 'package:flutter/material.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final String label =
      'Crea una cuenta con nosotros y descubre fotógrafos cerca de tu ubicación para cualquier evento o sesión.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: Constants.contentPadding,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              spacing: Constants.paddingValue,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox.square(
                    dimension: 200,
                    child: Image.asset('assets/images/logo1.png'),
                  ),
                ),
                const Text(
                  'Bienvenido a JD PhotoMap',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Constants.paddingValue * 2,
                  ),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
