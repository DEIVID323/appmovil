import 'package:flutter/material.dart';
import 'package:jdphotomap/src/core/router/app_router.dart';
import 'package:jdphotomap/src/core/theme/theme.dart';

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
    return MaterialApp.router(
      theme: LightTheme.instance,
      darkTheme: DarkTheme.instance,
      themeMode: ThemeMode.light,
      routerConfig: _appRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
