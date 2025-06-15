import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/onboarding/domain/entity/login_data.dart';
import 'package:smartecosystems/features/onboarding/domain/entity/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> logIn(LogInData authRequest);
  Future<Either<Failure, void>> register(User user);
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, bool>> checkAuthenticationStatus();
  Future<Either<Failure, String>> getUserToken();
}
