import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/onboarding/domain/entity/login_data.dart';
import 'package:smartecosystems/features/onboarding/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure, void>> call(LogInData loginData) async {
    return await authRepository.logIn(loginData);
  }
}
