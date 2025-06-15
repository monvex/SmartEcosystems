import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:smartecosystems/core/api/api_client.dart';

class RemoteDevicesDataSource {
  final ApiClient apiClient;

  RemoteDevicesDataSource({required this.apiClient});

  Future<dynamic> getDevicesInfo(String token) async {
    var result = await apiClient.get(
      "/devices_lite",
      params: {'timeoffset': -3, 'device_type': 'NaN', 'group_slug': ''},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );
    return result.data;
  }

  Future<dynamic> getRainData(String token, int deviceId, String period) async {
    var result = await apiClient.get(
      "/load_rain_data",
      params: {'device_id': deviceId, 'period': period},
      options: Options(headers: {'Accept': 'application/json'}),
    );
    return result.data;
  }

  Future<dynamic> getWindRoseData(
    String token,
    int deviceId,
    String period,
  ) async {
    var result = await apiClient.get(
      "/load_wind_rose_data",
      params: {'device_id': deviceId, 'period': period},
      options: Options(headers: {'Accept': 'application/json'}),
    );
    return result.data;
  }

  Future<Uint8List> getLastSeismicSparklineImage(
    String token,
    int deviceId,
  ) async {
    var result = await apiClient.get(
      "/data/get_last_seismic_sparkline_image",
      params: {'device_id': deviceId},
      options: Options(
        responseType: ResponseType.bytes,
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return result.data;
  }

  Future logout() async {
    await apiClient.post('/api/v1/logout');
  }
}
