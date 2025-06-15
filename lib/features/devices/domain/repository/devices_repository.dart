import 'dart:typed_data';

import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/devices/domain/entity/devices_info.dart';
import 'package:smartecosystems/features/devices/domain/entity/raid_data.dart';
import 'package:smartecosystems/features/devices/domain/entity/wind_rose_data.dart';

abstract class DevicesRepository {
  Future<Either<Failure, DevicesInfo>> getDevicesInfo(String token);
  Future<Either<Failure, Uint8List>> getLastSeismicSparklineImage(
    String token,
    int deviceId,
  );
  Future<Either<Failure, Device>> getDeviceInfoById(String token, int deviceId);
  Future<Either<Failure, RainData>> loadRainData(
    String token,
    int deviceId,
    String period,
  );
  Future<Either<Failure, WindRoseData>> loadWindRoseData(
    String token,
    int deviceId,
    String period,
  );
  // Future<Either<Failure, DataForPeriod>> loadDataForPeriod(
  //   String token,
  //   int deviceId,
  //   DateTime dtStart,
  //   DateTime dtEnd,
  // );
  // Future<Either<Failure, SeismicInfo>> getSeismicInfo(
  //   String token,
  //   int deviceId,
  //   int deviceType,
  // );
  // Future<Either<Failure, SeismicEvents>> getSeismicEvents(
  //   String token,
  //   String deviceUuid,
  // );
  // Future<Either<Failure, ModuleInfo>> getModuleInfo(
  //   String token,
  //   int deviceId,
  //   int deviceType,
  // );
}
