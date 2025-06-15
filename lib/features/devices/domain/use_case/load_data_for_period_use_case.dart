// import 'package:smartecosystems/core/model/either.dart';
// import 'package:smartecosystems/core/model/failure.dart';
// import 'package:smartecosystems/features/devices/domain/entity/devices_info.dart';
// import 'package:smartecosystems/features/devices/domain/repository/devices_repository.dart';

// class LoadDataForPeriodUseCase {
//   final DevicesRepository devicesRepository;

//   LoadDataForPeriodUseCase({required this.devicesRepository});

//   Future<Either<Failure, DataForPeriod>> call(
//     String token,
//     int deviceId,
//     DateTime dtStart,
//     DateTime dtEnd,
//   ) async {
//     return await devicesRepository.loadDataForPeriod(
//       token,
//       deviceId,
//       dtStart,
//       dtEnd,
//     );
//   }
// }
