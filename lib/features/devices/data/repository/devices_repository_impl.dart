import 'dart:typed_data';

import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/devices/data/datasources/remote_devices_datasource.dart';
import 'package:smartecosystems/features/devices/domain/entity/devices_info.dart';
import 'package:smartecosystems/features/devices/domain/entity/raid_data.dart';
import 'package:smartecosystems/features/devices/domain/entity/wind_rose_data.dart';
import 'package:smartecosystems/features/devices/domain/repository/devices_repository.dart';

class DevicesRepositoryImpl implements DevicesRepository {
  final RemoteDevicesDataSource remoteDevicesDataSource;

  DevicesRepositoryImpl({required this.remoteDevicesDataSource});

  @override
  Future<Either<Failure, Device>> getDeviceInfoById(String token, int id) {
    // TODO: implement getDeviceInfoById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, DevicesInfo>> getDevicesInfo(String token) async {
    try {
      final devicesInfo = await remoteDevicesDataSource.getDevicesInfo(token);
      final convertedResult = DevicesInfo.fromJson(devicesInfo);
      return Right(convertedResult);
    } catch (e) {
      return Left(
        ServerFailure(errorMessage: "Ошибка при получении списка устройств"),
      );
    }
  }

  @override
  Future<Either<Failure, Uint8List>> getLastSeismicSparklineImage(
    String token,
    int deviceId,
  ) async {
    try {
      final image = await remoteDevicesDataSource.getLastSeismicSparklineImage(
        token,
        deviceId,
      );
      return Right(image);
    } catch (e) {
      return Left(
        ServerFailure(errorMessage: "Ошибка при получении sparkline"),
      );
    }
  }

  @override
  Future<Either<Failure, RainData>> loadRainData(
    String token,
    int deviceId,
    String period,
  ) async {
    try {
      final rainData = await remoteDevicesDataSource.getRainData(
        token,
        deviceId,
        period,
      );
      final convertedResult = RainData.fromJson(rainData);
      return Right(convertedResult);
    } catch (e) {
      return Left(
        ServerFailure(errorMessage: "Ошибка при получении rain data"),
      );
    }
  }

  @override
  Future<Either<Failure, WindRoseData>> loadWindRoseData(
    String token,
    int deviceId,
    String period,
  ) async {
    try {
      final windRoseData = await remoteDevicesDataSource.getWindRoseData(
        token,
        deviceId,
        period,
      );
      final convertedResult = WindRoseData.fromJson(windRoseData);
      return Right(convertedResult);
    } catch (e) {
      return Left(
        ServerFailure(errorMessage: "Ошибка при получении wind rose data"),
      );
    }
  }
}
