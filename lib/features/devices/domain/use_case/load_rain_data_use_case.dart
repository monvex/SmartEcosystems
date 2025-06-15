import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/devices/domain/entity/raid_data.dart';
import 'package:smartecosystems/features/devices/domain/repository/devices_repository.dart';

class LoadRainDataUseCase {
  final DevicesRepository devicesRepository;

  LoadRainDataUseCase({required this.devicesRepository});

  Future<Either<Failure, RainData>> call(
    String token,
    int deviceId,
    String period,
  ) async {
    return await devicesRepository.loadRainData(token, deviceId, period);
  }
}
