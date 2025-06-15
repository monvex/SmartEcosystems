import 'package:smartecosystems/core/api/api_client.dart';
import 'package:smartecosystems/features/onboarding/data/model/user_model.dart';

class RemoteAuthDataSource {
  final ApiClient apiClient;

  RemoteAuthDataSource({required this.apiClient});

  Future<String> login(String email, String password) async {
    final result = await apiClient.post(
      '/token',
      data: {'login': email, 'password': password},
    );

    return result.data['access_token'];
  }

  Future register(UserModel userModel) async {
    await apiClient.post('/profile/registration', data: userModel.toJson());
  }

  Future logout() async {
    await apiClient.post('/api/v1/logout');
  }
}
