import 'dart:typed_data';

import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/devices/domain/repository/devices_repository.dart';

class GetLastSeismicSparklineImageUseCase {
  final DevicesRepository devicesRepository;

  GetLastSeismicSparklineImageUseCase({required this.devicesRepository});

  Future<Either<Failure, Uint8List>> call(String token, int deviceId) async {
    return await devicesRepository.getLastSeismicSparklineImage(
      token,
      deviceId,
    );
  }
}
