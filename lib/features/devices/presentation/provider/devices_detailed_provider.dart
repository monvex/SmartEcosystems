import 'package:flutter/material.dart';
import 'package:smartecosystems/features/devices/domain/entity/raid_data.dart';
import 'package:smartecosystems/features/devices/domain/entity/wind_rose_data.dart';
import 'package:smartecosystems/features/devices/domain/use_case/load_rain_data_use_case.dart';
import 'package:smartecosystems/features/devices/domain/use_case/load_wind_rose_data_use_case.dart';

enum DeviceDetailsStatus { initial, loading, success, error }

class DeviceDetailsProvider with ChangeNotifier {
  final LoadWindRoseDataUseCase loadWindRoseDataUseCase;
  final LoadRainDataUseCase loadRainDataUseCase;

  RainData? rainData;
  WindRoseData? windRoseData;

  DeviceDetailsStatus rainStatus = DeviceDetailsStatus.initial;
  DeviceDetailsStatus windStatus = DeviceDetailsStatus.initial;

  String errorMessage = '';

  DeviceDetailsProvider({
    required this.loadWindRoseDataUseCase,
    required this.loadRainDataUseCase,
  });

  void loadData(String token, int deviceId, String period) {
    getRainData(token, deviceId, period);
    getWindRoseData(token, deviceId, period);
  }

  Future<void> getRainData(String token, int deviceId, String period) async {
    rainStatus = DeviceDetailsStatus.loading;
    notifyListeners();

    final result = await loadRainDataUseCase(token, deviceId, period);

    result.fold(
      (failure) {
        rainStatus = DeviceDetailsStatus.error;
        errorMessage = failure.errorMessage;
        notifyListeners();
      },
      (data) {
        rainData = data;
        rainStatus = DeviceDetailsStatus.success;
        errorMessage = '';
        notifyListeners();
      },
    );
  }

  Future<void> getWindRoseData(
    String token,
    int deviceId,
    String period,
  ) async {
    windStatus = DeviceDetailsStatus.loading;
    notifyListeners();

    final result = await loadWindRoseDataUseCase(token, deviceId, period);

    result.fold(
      (failure) {
        windStatus = DeviceDetailsStatus.error;
        errorMessage = failure.errorMessage;
        notifyListeners();
      },
      (data) {
        windRoseData = data;
        windStatus = DeviceDetailsStatus.success;
        errorMessage = '';
        notifyListeners();
      },
    );
  }
}
