import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';
import 'package:jdphotomap/src/core/extensions/show_status_extension.dart';
import 'package:jdphotomap/src/core/extensions/toast_extension.dart';
import 'package:jdphotomap/src/features/login/domain/entity/login_entity.dart';
import 'package:jdphotomap/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:jdphotomap/src/injection/injection.dart';
import 'package:shared/auth_button.dart';
import 'package:shared/shared.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  LoginEntity _loginEntity = const LoginEntity.empty();

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  void _updateLoginEntity({required LoginEntity loginEntity}) {
    setState(() {
      _loginEntity = loginEntity;
    });
  }

  void _onLoginButtonPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<LoginCubit>().login(loginEntity: _loginEntity);
    }
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
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
            context.pop();
            context.showErrorToast(state.message);
            return;
          }
          if (state.status == Status.loading) {
            context.showLoading();
          }
        },
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(forceMaterialTransparency: true),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: Constants.contentPadding,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(
                        top: Constants.paddingValue * 10,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            fontSize: 40,
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    TextFormField(
                      controller: _emailController,
                      onSaved: (String? value) => _updateLoginEntity(
                        loginEntity: _loginEntity.copyWith(email: value),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                      ),
                      validator: (String? value) =>
                          value!.isEmpty ? 'Ingrese su correo' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passController,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                      ),
                      onSaved: (String? value) => _updateLoginEntity(
                        loginEntity: _loginEntity.copyWith(password: value),
                      ),
                      obscureText: true,
                      validator: (String? value) =>
                          value!.isEmpty ? 'Ingrese su contraseña' : null,
                    ),
                    const SizedBox(height: 20),
                    AuthButton(
                      text: 'Iniciar Sesión',
                      contentPadding: Constants.contentPadding,
                      onTap: _onLoginButtonPressed,
                      color: Constants.primaryColor,
                      borderRadius: Constants.borderRadius,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
