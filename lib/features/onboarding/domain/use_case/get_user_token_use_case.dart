import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/onboarding/domain/repository/auth_repository.dart';

class GetUserTokenUseCase {
  final AuthRepository authRepository;

  GetUserTokenUseCase({required this.authRepository});

  Future<Either<Failure, String>> call() async {
    return await authRepository.getUserToken();
  }
}
