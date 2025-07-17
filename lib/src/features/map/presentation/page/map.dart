import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart'; // depende de tu estructura

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapboxMap _controller;
  void _onMapCreated(MapboxMap map) {
    _controller = map;

    // Aquí puedes agregar más lógica para configurar el mapa
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Mapa'),

        forceMaterialTransparency: true,
      ),
      body: MapWidget(onMapCreated: _onMapCreated),
    );
  }
}
