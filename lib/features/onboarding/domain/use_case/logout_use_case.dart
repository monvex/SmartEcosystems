import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/onboarding/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  Future<Either<Failure, void>> call() async {
    return await authRepository.logOut();
  }
}
