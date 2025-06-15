import 'package:get_it/get_it.dart';
import 'package:smartecosystems/core/api/api_client.dart';
import 'package:smartecosystems/core/database/app_database.dart';
import 'package:smartecosystems/features/devices/data/datasources/remote_devices_datasource.dart';
import 'package:smartecosystems/features/devices/data/repository/devices_repository_impl.dart';
import 'package:smartecosystems/features/devices/domain/repository/devices_repository.dart';
import 'package:smartecosystems/features/devices/domain/use_case/get_devices_info_use_case.dart';
import 'package:smartecosystems/features/devices/domain/use_case/get_last_seismic_sparkline_image_use_case.dart';
import 'package:smartecosystems/features/devices/domain/use_case/load_rain_data_use_case.dart';
import 'package:smartecosystems/features/devices/domain/use_case/load_wind_rose_data_use_case.dart';
import 'package:smartecosystems/features/devices/presentation/provider/devices_detailed_provider.dart';
import 'package:smartecosystems/features/devices/presentation/provider/devices_provider.dart';
import 'package:smartecosystems/features/onboarding/data/datasources/local_auth_datasource.dart';
import 'package:smartecosystems/features/onboarding/data/datasources/remote_auth_datasource.dart';
import 'package:smartecosystems/features/onboarding/data/repository/auth_repository_impl.dart';
import 'package:smartecosystems/features/onboarding/domain/repository/auth_repository.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/check_authentication_status_use_case.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/get_user_token_use_case.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/login_use_case.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/logout_use_case.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/registration_use_case.dart';
import 'package:smartecosystems/features/onboarding/presentation/provider/auth_provider.dart';

var getIt = GetIt.instance;

Future setup() async {
  await registerDatabase();
  registerApi();
  registerDatasources();
  registerRepositories();
  registerUseCases();
  registerProviders();
}

Future registerDatabase() async {
  getIt.registerSingleton(await AppDatabase.database);
}

void registerApi() async {
  getIt.registerSingleton<ApiClient>(
    ApiClient(baseUrl: "https://smartecosystems.petrsu.ru/api/v1"),
  );
}

void registerDatasources() async {
  getIt.registerSingleton(LocalAuthDatasource(database: getIt()));
  getIt.registerSingleton(RemoteAuthDataSource(apiClient: getIt()));
  getIt.registerSingleton(RemoteDevicesDataSource(apiClient: getIt()));
}

void registerRepositories() async {
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      localAuthDatasource: getIt(),
      remoteAuthDataSource: getIt(),
    ),
  );
  getIt.registerSingleton<DevicesRepository>(
    DevicesRepositoryImpl(remoteDevicesDataSource: getIt()),
  );
}

void registerUseCases() async {
  getIt.registerSingleton(LoginUseCase(authRepository: getIt()));
  getIt.registerSingleton(RegistrationUseCase(authRepository: getIt()));
  getIt.registerSingleton(LogoutUseCase(authRepository: getIt()));
  getIt.registerSingleton(
    CheckAuthenticationStatusUseCase(authRepository: getIt()),
  );
  getIt.registerSingleton(GetUserTokenUseCase(authRepository: getIt()));
  getIt.registerSingleton(GetDevicesInfoUseCase(devicesRepository: getIt()));
  getIt.registerSingleton(
    GetLastSeismicSparklineImageUseCase(devicesRepository: getIt()),
  );
  getIt.registerSingleton(LoadWindRoseDataUseCase(devicesRepository: getIt()));
  getIt.registerSingleton(LoadRainDataUseCase(devicesRepository: getIt()));
}

void registerProviders() async {
  getIt.registerSingleton(
    AuthProvider(
      loginUseCase: getIt(),
      registrationUseCase: getIt(),
      logoutUseCase: getIt(),
      checkAuthenticationStatusUseCase: getIt(),
      getUserTokenUseCase: getIt(),
    ),
  );
  getIt.registerSingleton(
    DevicesProvider(
      getDevicesInfoUseCase: getIt(),
      getLastSeismicSparklineImageUseCase: getIt(),
    ),
  );
  getIt.registerFactory<DeviceDetailsProvider>(
    () => DeviceDetailsProvider(
      loadWindRoseDataUseCase: getIt<LoadWindRoseDataUseCase>(),
      loadRainDataUseCase: getIt<LoadRainDataUseCase>(),
    ),
  );
}
