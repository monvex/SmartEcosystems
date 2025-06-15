import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/onboarding/domain/entity/user.dart';
import 'package:smartecosystems/features/onboarding/domain/repository/auth_repository.dart';

class RegistrationUseCase {
  final AuthRepository authRepository;

  RegistrationUseCase({required this.authRepository});

  Future<Either<Failure, void>> call(User user) async {
    return await authRepository.register(user);
  }
}
