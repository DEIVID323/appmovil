import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';
import 'package:jdphotomap/src/core/extensions/show_status_extension.dart';
import 'package:jdphotomap/src/core/extensions/toast_extension.dart';
import 'package:jdphotomap/src/core/functions/validators.dart';
import 'package:jdphotomap/src/features/signup/domain/entity/signup_entity.dart';
import 'package:jdphotomap/src/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:jdphotomap/src/injection/injection.dart';
import 'package:shared/auth_button.dart';
import 'package:shared/shared.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  SignupEntity _entity = const SignupEntity.empty();

  void _updateData({required SignupEntity entity}) {
    setState(() {
      _entity = entity;
    });
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<SignupCubit>().signUp(entity: _entity);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      extendBodyBehindAppBar: true,
      body: BlocProvider<SignupCubit>(
        create: (BuildContext context) => sl<SignupCubit>(),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (BuildContext context, SignupState state) {
            if (state.status == Status.error) {
              context.showErrorToast(state.message ?? '');
              return;
            }
            if (state.status == Status.loading) {
              context.showLoading();
            }
          },
          builder: (BuildContext context, SignupState state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _nameController,
                      validator: Validators.validateEmpty,
                      onSaved: (String? newValue) {
                        _updateData(
                          entity: _entity.copyWith(username: newValue),
                        );
                      },
                      decoration: const InputDecoration(
                        labelText: 'Nombre completo',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? newValue) {
                        _updateData(entity: _entity.copyWith(email: newValue));
                      },
                      validator: Validators.validateEmail,
                      decoration: const InputDecoration(labelText: 'Correo'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      onSaved: (String? newValue) {
                        _updateData(
                          entity: _entity.copyWith(password: newValue),
                        );
                      },
                      validator: Validators.validatePassword,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                      ),
                    ),
                    const SizedBox(height: 30),
                    AuthButton(
                      text: 'Registrarse',
                      contentPadding: Constants.contentPadding,
                      color: Constants.primaryColor,
                      borderRadius: Constants.borderRadius,
                      onTap: _signUp,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
