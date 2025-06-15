import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<MapWindow> _mapController = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(
        onMapCreated: (mapWindow) {
          _mapController.complete(mapWindow);
          // Установка начальной позиции карты с обязательными параметрами
          mapWindow.map.move(
            CameraPosition(
              Point(latitude: 55.751244, longitude: 37.618423), // Координаты
              zoom: 12,
              azimuth: 0, // Обязательный параметр - угол поворота (0-360°)
              tilt: 0, // Обязательный параметр - угол наклона (0-60°)
            ),
          );
        },
      ),
    );
  }
}
