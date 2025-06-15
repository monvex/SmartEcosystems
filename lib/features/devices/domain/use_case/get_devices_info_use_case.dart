import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/devices/domain/entity/devices_info.dart';
import 'package:smartecosystems/features/devices/domain/repository/devices_repository.dart';

class GetDevicesInfoUseCase {
  final DevicesRepository devicesRepository;

  GetDevicesInfoUseCase({required this.devicesRepository});

  Future<Either<Failure, DevicesInfo>> call(String token) async {
    return await devicesRepository.getDevicesInfo(token);
  }
}
