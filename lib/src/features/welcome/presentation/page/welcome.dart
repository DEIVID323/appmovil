import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';
import 'package:jdphotomap/src/features/welcome/presentation/widgets/welcome_button.dart';

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
            padding: Constants.contentPadding.copyWith(
              left: Constants.paddingValue * 6,
              right: Constants.paddingValue * 6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              spacing: Constants.paddingValue,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
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
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
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
                Column(
                  spacing: Constants.paddingValue * 2.5,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    WelcomeButton(
                      label: 'Crear una cuenta',
                      onPressed: () {
                        context.go('/register');
                      },
                      color: Constants.primaryColor,
                      textColor: Colors.white,
                    ),
                    WelcomeButton(
                      label: 'Iniciar sesión',
                      onPressed: () {
                        context.go('/login');
                      },
                      color: Constants.secondaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
