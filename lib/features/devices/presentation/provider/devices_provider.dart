import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:smartecosystems/features/devices/domain/entity/devices_info.dart';
import 'package:smartecosystems/features/devices/domain/use_case/get_devices_info_use_case.dart';
import 'package:smartecosystems/features/devices/domain/use_case/get_last_seismic_sparkline_image_use_case.dart';

enum DevicesStatus {
  initial,
  loading,
  loadingImage,
  successImage,
  success,
  error,
}

class DevicesProvider with ChangeNotifier {
  final GetDevicesInfoUseCase getDevicesInfoUseCase;
  final GetLastSeismicSparklineImageUseCase getLastSeismicSparklineImageUseCase;
  final Map<int, Uint8List> _imageCache = {};

  DevicesProvider({
    required this.getDevicesInfoUseCase,
    required this.getLastSeismicSparklineImageUseCase,
  });

  List<Device> devices = [];

  DevicesStatus status = DevicesStatus.initial;
  String errorMessage = '';

  void getDevicesInfo(String token) async {
    status = DevicesStatus.loading;
    notifyListeners();

    var result = await getDevicesInfoUseCase(token);

    result.fold(
      (l) {
        status = DevicesStatus.error;
        errorMessage = l.errorMessage;
        notifyListeners();
      },
      (r) {
        devices = r.devices;
        status = DevicesStatus.success;
        errorMessage = '';
        notifyListeners();
      },
    );
  }

  Future<Uint8List> getLastSeismicSparklineImage(
    String token,
    int deviceId,
  ) async {
    if (_imageCache.containsKey(deviceId)) {
      return _imageCache[deviceId]!;
    }
    var result = await getLastSeismicSparklineImageUseCase(token, deviceId);

    result.fold(
      (l) {
        status = DevicesStatus.error;
        errorMessage = l.errorMessage;
        notifyListeners();
      },
      (r) {
        status = DevicesStatus.successImage;
        errorMessage = '';
        notifyListeners();
        _imageCache[deviceId] = r;
        return r;
      },
    );
    throw Exception("anlak");
  }
}
