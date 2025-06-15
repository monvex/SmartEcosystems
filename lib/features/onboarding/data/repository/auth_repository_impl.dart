import 'package:smartecosystems/core/model/either.dart';
import 'package:smartecosystems/core/model/failure.dart';
import 'package:smartecosystems/features/onboarding/data/datasources/local_auth_datasource.dart';
import 'package:smartecosystems/features/onboarding/data/datasources/remote_auth_datasource.dart';
import 'package:smartecosystems/features/onboarding/domain/entity/login_data.dart';
import 'package:smartecosystems/features/onboarding/domain/entity/user.dart';
import 'package:smartecosystems/features/onboarding/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalAuthDatasource localAuthDatasource;
  final RemoteAuthDataSource remoteAuthDataSource;

  AuthRepositoryImpl({
    required this.localAuthDatasource,
    required this.remoteAuthDataSource,
  });

  @override
  Future<Either<Failure, void>> logIn(LogInData authRequest) async {
    try {
      final token = await remoteAuthDataSource.login(
        authRequest.login,
        authRequest.password,
      );
      await localAuthDatasource.insertUser(authRequest.login, token);
      return Right(null);
    } catch (e) {
      return Left(
        ServerFailure(
          errorMessage:
              "Ошибка при получении токена.сохренении токена в базе данных",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await remoteAuthDataSource.logout();
      await localAuthDatasource.deleteUser(0);

      return Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Ошибка при удалении токена"));
    }
  }

  @override
  Future<Either<Failure, void>> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> checkAuthenticationStatus() async {
    try {
      final Map<String, dynamic>? userData =
          await localAuthDatasource.getUser();
      if (userData != null && userData['access_token'] != "") {
        return Right(true);
      } else {
        return Right(false);
      }
    } catch (e) {
      return Left(
        DatabaseFailure(errorMessage: "Ошибка при получении пользователя"),
      );
    }
  }

  @override
  Future<Either<Failure, String>> getUserToken() async {
    try {
      final Map<String, dynamic>? userData =
          await localAuthDatasource.getUser();
      return Right(userData?['access_token']);
    } catch (e) {
      return Left(
        DatabaseFailure(errorMessage: "Ошибка при получении пользователя"),
      );
    }
  }
}
