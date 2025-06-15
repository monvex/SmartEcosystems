import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/devices/domain/entity/wind_rose_data.dart';
import 'package:smartecosystems/features/devices/domain/repository/devices_repository.dart';

class LoadWindRoseDataUseCase {
  final DevicesRepository devicesRepository;

  LoadWindRoseDataUseCase({required this.devicesRepository});

  Future<Either<Failure, WindRoseData>> call(
    String token,
    int deviceId,
    String period,
  ) async {
    return await devicesRepository.loadWindRoseData(token, deviceId, period);
  }
}
