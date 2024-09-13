import 'package:auto_route/auto_route.dart';
import 'package:firebase_learn/container_injection.dart';
import 'package:firebase_learn/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_learn/features/Auth/presentation/pages/login_page.dart';
import 'package:firebase_learn/features/Users/presentation/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(const CheckLoggedInEvent()),
        ),
        BlocProvider(
          create: (context) => sl<UsersBloc>(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'))),
                  )),
              leadingWidth: 160),
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(18),
                  margin: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      const Text("Welcome"),
                      const SizedBox(height: 16),
                      Text(state.user.email ?? ""),
                      const SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<UsersBloc>(context).add(
                                const GetUserEvent(
                                    userId: 'bHY5hRiWzDNDTqxMENUpQ44YzoI3'));
                          },
                          child: const Text("Logout"))
                    ],
                  ),
                );
              } else {
                return const LoginPage();
              }
            },
          ),
        );
      }),
    );
  }
}
