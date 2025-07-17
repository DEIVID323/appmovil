import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';
import 'package:jdphotomap/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:jdphotomap/src/injection/injection.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final AppState _appState;
  late final AppCubit _appCubit;
  final String profileImage = 'assets/images/logo.jpg';
  final String testImage =
      'https://missiongrit.com/wp-content/uploads/2024/08/the-top-12-birthday-party-venues-in-charlotte-nc.webp';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _appCubit = sl<AppCubit>();
    _appState = _appCubit.state;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 250,
                collapsedHeight: 90,
                actions: <Widget>[
                  Tooltip(
                    message: 'Cerrar sesion',
                    child: IconButton(
                      onPressed: () {
                        _appCubit.signOut();
                      },
                      icon: const Icon(Icons.exit_to_app),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: ClipRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image.asset(profileImage, fit: BoxFit.cover),
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              color: Colors.blue.withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            profileImage,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _appState.user!.name.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(
                  dividerColor: Colors.transparent,
                  controller: _tabController,
                  tabs: const <Widget>[
                    Tab(text: 'Portafolio'),
                    Tab(text: 'Servicios'),
                    Tab(text: 'Acerca de mí'),
                  ],
                ),
              ),
            ],
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            // Tab 1 - Portafolio con lista
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => ListTile(
                      leading: const Icon(Icons.work),
                      title: Text('Proyecto ${index + 1}'),
                      subtitle: const Text('Descripción breve del proyecto'),
                    ),
                    childCount: 10,
                  ),
                ),
              ],
            ),

            CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(12),
                  sliver: SliverList.builder(
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Constants.paddingValue,
                        ),
                        child: ClipRRect(
                          borderRadius: Constants.borderRadius,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              Image.network(
                                testImage,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Boda',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Tab 3 - Acerca de mí con texto largo
            CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Soy un desarrollador con pasión por Flutter y arquitectura limpia. '
                      'Tengo experiencia en el desarrollo de aplicaciones móviles y web, '
                      '\n\nMi objetivo es construir soluciones eficientes, mantenibles y escalables.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
