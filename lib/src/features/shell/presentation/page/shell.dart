import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jdphotomap/src/features/custom_navigation_bar/domain/entity/destination_route.dart';
import 'package:jdphotomap/src/features/custom_navigation_bar/presentation/page/custom_navigation_bar.dart';
import 'package:jdphotomap/src/features/custom_navigation_bar/presentation/widget/destination.dart';

class Shell extends StatefulWidget {
  const Shell({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const CustomNavigationBar(
        destinations: <DestinationRoute>[
          DestinationRoute(
            page: 0,
            path: '/home',
            destinaton: Destination(
              icon: HugeIcons.strokeRoundedHome02,
              label: 'Inicio',
            ),
          ),
          DestinationRoute(
            page: 1,
            path: '/search',
            destinaton: Destination(
              icon: HugeIcons.strokeRoundedSearch02,
              label: 'Buscar',
            ),
          ),
          DestinationRoute(
            page: 2,
            path: '/map',
            destinaton: Destination(
              icon: HugeIcons.strokeRoundedMaps,
              label: 'Mapa',
            ),
          ),
          DestinationRoute(
            page: 3,
            path: '/myProfile',
            destinaton: Destination(
              icon: HugeIcons.strokeRoundedUser02,
              label: 'Perfil',
            ),
          ),
        ],
      ),
    );
  }
}
