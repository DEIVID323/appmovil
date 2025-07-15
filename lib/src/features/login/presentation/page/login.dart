import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';
import 'package:jdphotomap/src/core/extensions/toast_extension.dart';
import 'package:jdphotomap/src/features/login/domain/entity/login_entity.dart';
import 'package:jdphotomap/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:jdphotomap/src/injection/injection.dart';
import 'package:shared/shared.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  final LoginEntity _loginEntity = const LoginEntity.empty();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  void _updateLoginEntity({required LoginEntity loginEntity}) {
    setState(() {
      _loginEntity.copyWith(
        email: loginEntity.email,
        password: loginEntity.password,
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (BuildContext context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state.status == Status.error) {
            context.showErrorToast(state.message);
          }
        },
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: Constants.contentPadding,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        onSaved:
                            (String? value) => _updateLoginEntity(
                              loginEntity: _loginEntity.copyWith(email: value),
                            ),
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                        ),
                        validator:
                            (String? value) =>
                                value!.isEmpty ? 'Ingrese su correo' : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passController,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                        ),
                        onSaved:
                            (String? value) => _updateLoginEntity(
                              loginEntity: _loginEntity.copyWith(
                                password: value,
                              ),
                            ),
                        obscureText: true,
                        validator:
                            (String? value) =>
                                value!.isEmpty ? 'Ingrese su contraseña' : null,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<LoginCubit>().login(
                              loginEntity: _loginEntity,
                            );
                          }
                        },

                        child: const Text('Ingresar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
