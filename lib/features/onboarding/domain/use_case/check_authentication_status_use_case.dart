import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/onboarding/domain/repository/auth_repository.dart';

class CheckAuthenticationStatusUseCase {
  final AuthRepository authRepository;

  CheckAuthenticationStatusUseCase({required this.authRepository});

  Future<Either<Failure, bool>> call() async {
    return await authRepository.checkAuthenticationStatus();
  }
}
