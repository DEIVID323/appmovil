import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdphotomap/src/core/router/app_router.dart';
import 'package:jdphotomap/src/core/theme/theme.dart';
import 'package:jdphotomap/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:jdphotomap/src/injection/injection.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
    LightTheme.initialize(context);
    DarkTheme.initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (BuildContext context) => sl<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (BuildContext context, AppState state) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1)),
            child: MaterialApp.router(
              theme: LightTheme.instance,
              darkTheme: DarkTheme.instance,
              themeMode: ThemeMode.light,
              routerConfig: _appRouter.router,
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
