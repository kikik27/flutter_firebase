import 'package:auto_route/auto_route.dart';
import 'package:firebase_learn/container_injection.dart';
import 'package:firebase_learn/core/colors/color_data.dart';
import 'package:firebase_learn/core/routes/app_router.dart';
import 'package:firebase_learn/core/theme/app_theme.dart';
import 'package:firebase_learn/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  late BuildContext _dialogContext;

  BlocProvider<AuthBloc> buildBlocProvider() {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.all(32),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'email',
                keyboardType: TextInputType.emailAddress,
                style: AppTheme.textStyle.textSMRegular
                    .copyWith(color: ColorData.grey900),
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: AppTheme.textStyle.textSMRegular
                        .copyWith(color: ColorData.grey500),
                    prefixIcon: const Icon(Icons.email_outlined,
                        color: ColorData.grey700),
                    prefixIconColor: ColorData.grey200,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: ColorData.grey500),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: ColorData.grey500),
                    )),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.email(),
                  FormBuilderValidators.required()
                ]),
              ),
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: FormBuilderValidators.required(),
                obscureText: true,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final email =
                                _formKey.currentState!.fields['email']?.value;
                            final password = _formKey
                                .currentState!.fields['password']?.value;
                            BlocProvider.of<AuthBloc>(context)
                                .add(AuthSignIn(email, password));
                          }
                        },
                        child: const Text('Login'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(const AuthSignInGoogle());
                        },
                        child: const Text('Login With Google'),
                      ),
                    ],
                  );
                },
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is Loading) {
                    _showLoadingDialog(context);
                  } else if (state is AuthError) {
                    _hideLoadingDialog();
                    _showErrorDialog(context, state.message);
                  } else if (state is Authenticated) {
                    _hideLoadingDialog();
                    context.router.pushAndPopUntil(const HomeRoute(),
                        predicate: (Route<dynamic> route) => false);
                  } else {
                    _hideLoadingDialog();
                  }
                },
                child: const SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(body: buildBlocProvider()),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    if (!Navigator.of(context).canPop()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _dialogContext = context;
          return const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Loading...", textAlign: TextAlign.center),
              ],
            ),
          );
        },
      );
    }
  }

  void _hideLoadingDialog() {
    if (Navigator.of(_dialogContext).canPop()) {
      Navigator.of(_dialogContext).pop();
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
