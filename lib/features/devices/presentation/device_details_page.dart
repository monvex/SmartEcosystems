import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartecosystems/core/di/get_it.dart';
import 'package:smartecosystems/features/devices/presentation/provider/devices_detailed_provider.dart';
import 'package:smartecosystems/features/onboarding/presentation/provider/auth_provider.dart';

class DeviceDetailsPage extends StatelessWidget {
  final int deviceId;
  final String deviceName;
  final String locationDescription;

  const DeviceDetailsPage({
    super.key,
    required this.deviceId,
    required this.deviceName,
    required this.locationDescription,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => getIt<DeviceDetailsProvider>(),
      child: DeviceDetailsScreen(
        deviceId: deviceId,
        deviceName: deviceName,
        locationDescription: locationDescription,
      ),
    );
  }
}

// DeviceDetailsPage остается без изменений

class DeviceDetailsScreen extends StatefulWidget {
  final int deviceId;
  final String deviceName;
  final String locationDescription;

  const DeviceDetailsScreen({
    super.key,
    required this.deviceId,
    required this.deviceName,
    required this.locationDescription,
  });

  @override
  State<DeviceDetailsScreen> createState() => _DeviceDetailsScreenState();
}

class _DeviceDetailsScreenState extends State<DeviceDetailsScreen> {
  String rainPeriod = 'day';
  String windPeriod = 'day';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitialData();
    });
  }

  Future<void> _loadInitialData() async {
    final token = context.read<AuthProvider>().token;
    final provider = context.read<DeviceDetailsProvider>();

    await provider.getRainData(token, widget.deviceId, rainPeriod);
    await provider.getWindRoseData(token, widget.deviceId, windPeriod);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Информация об устройстве')),
      body: Consumer<DeviceDetailsProvider>(
        builder: (context, provider, _) {
          if (provider.rainStatus == DeviceDetailsStatus.loading &&
              provider.windStatus == DeviceDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.rainStatus == DeviceDetailsStatus.error) {
            return Center(
              child: Text('Ошибка осадков: ${provider.errorMessage}'),
            );
          }

          if (provider.windStatus == DeviceDetailsStatus.error) {
            return Center(
              child: Text('Ошибка розы ветров: ${provider.errorMessage}'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Заголовок и описание
                Text(
                  widget.deviceName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(widget.locationDescription),
                const SizedBox(height: 24),

                // Блок осадков
                _buildRainSection(provider),
                const SizedBox(height: 24),

                // Блок розы ветров
                _buildWindRoseSection(provider),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRainSection(DeviceDetailsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPeriodSelector(
          currentPeriod: rainPeriod,
          onPeriodChanged: (period) async {
            setState(() => rainPeriod = period);
            final token = context.read<AuthProvider>().token;
            await provider.getRainData(token, widget.deviceId, period);
          },
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child:
              provider.rainData?.data.isNotEmpty ?? false
                  ? BarChart(
                    BarChartData(
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      barGroups:
                          provider.rainData!.data.asMap().entries.map((entry) {
                            return BarChartGroupData(
                              x: entry.key,
                              barRods: [
                                BarChartRodData(
                                  toY: entry.value,
                                  color: Colors.blue,
                                ),
                              ],
                            );
                          }).toList(),
                    ),
                  )
                  : const Center(child: Text('Нет данных по осадкам')),
        ),
      ],
    );
  }

  Widget _buildWindRoseSection(DeviceDetailsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPeriodSelector(
          currentPeriod: windPeriod,
          onPeriodChanged: (period) async {
            setState(() => windPeriod = period);
            final token = context.read<AuthProvider>().token;
            await provider.getWindRoseData(token, widget.deviceId, period);
          },
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child:
              provider.windRoseData?.data.isNotEmpty ?? false
                  ? RadarChart(
                    RadarChartData(
                      radarShape: RadarShape.polygon,
                      dataSets: [
                        RadarDataSet(
                          dataEntries:
                              provider.windRoseData!.data
                                  .map((e) => RadarEntry(value: e.toDouble()))
                                  .toList(),
                          fillColor: Colors.green.withOpacity(0.4),
                          borderColor: Colors.green,
                        ),
                      ],
                      radarBackgroundColor: Colors.transparent,
                      titlePositionPercentageOffset: 0.2,
                      getTitle: (index, angle) {
                        const directions = [
                          'С',
                          'СВ',
                          'В',
                          'ЮВ',
                          'Ю',
                          'ЮЗ',
                          'З',
                          'СЗ',
                        ];
                        return RadarChartTitle(text: directions[index % 8]);
                      },
                    ),
                  )
                  : const Center(child: Text('Нет данных по розе ветров')),
        ),
      ],
    );
  }

  Widget _buildPeriodSelector({
    required String currentPeriod,
    required void Function(String) onPeriodChanged,
  }) {
    const periods = {
      'day': 'СУТКИ',
      'week': 'НЕДЕЛЯ',
      'month': 'МЕСЯЦ',
      'year': 'ГОД',
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          periods.entries.map((e) {
            final selected = currentPeriod == e.key;
            return TextButton(
              onPressed: () => onPeriodChanged(e.key),
              child: Text(
                e.value,
                style: TextStyle(
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
    );
  }
}
