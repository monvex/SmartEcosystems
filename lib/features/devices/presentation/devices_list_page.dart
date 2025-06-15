import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartecosystems/core/di/get_it.dart';
import 'package:smartecosystems/features/devices/domain/entity/devices_info.dart'
    as models;
import 'package:smartecosystems/features/devices/presentation/device_details_page.dart';
import 'package:smartecosystems/features/devices/presentation/provider/devices_detailed_provider.dart';
import 'package:smartecosystems/features/devices/presentation/provider/devices_provider.dart';
import 'package:smartecosystems/features/onboarding/presentation/provider/auth_provider.dart';

const Map<int, String> deviceTypeMap = {
  1: 'Метеостанции',
  6: 'Сейсмостанции',
  3: 'Модули Smart Ecosystems',
  14: 'Пульсационные станции',
  17: 'Беспилотные системы',
};

Map<String, List<models.Device>> groupDevicesByType(
  List<models.Device> devices,
) {
  final Map<String, List<models.Device>> grouped = {};
  for (var device in devices) {
    final typeName = deviceTypeMap[device.deviceTypeId] ?? 'Другие';
    grouped.putIfAbsent(typeName, () => []).add(device);
  }

  const desiredOrder = [
    'Метеостанции',
    'Сейсмостанции',
    'Модули Smart Ecosystems',
    'Пульсационные станции',
    'Беспилотные системы',
  ];

  final Map<String, List<models.Device>> sortedEntries = {};

  for (final key in desiredOrder) {
    if (grouped.containsKey(key)) {
      sortedEntries[key] = grouped[key]!;
    }
  }

  for (final entry in grouped.entries) {
    if (!desiredOrder.contains(entry.key)) {
      sortedEntries[entry.key] = entry.value;
    }
  }

  return sortedEntries;
}

class DeviceListPage extends StatelessWidget {
  const DeviceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (BuildContext context) =>
              getIt<DevicesProvider>()
                ..getDevicesInfo(getIt<AuthProvider>().token),
      child: Scaffold(
        appBar: AppBar(title: const Text('Мои устройства')),
        body: Consumer<DevicesProvider>(
          builder: (context, provider, widget) {
            if (provider.status == DevicesStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.devices.isEmpty) {
              return const Center(child: Text('Нет устройств'));
            }

            final groupedDevices = groupDevicesByType(provider.devices);

            return ListView(
              children:
                  groupedDevices.entries.map((entry) {
                    return ExpandableDeviceSection(
                      key: PageStorageKey(entry.key),
                      title: entry.key,
                      devices: entry.value,
                    );
                  }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class ExpandableDeviceSection extends StatefulWidget {
  final String title;
  final List<models.Device> devices;

  const ExpandableDeviceSection({
    super.key,
    required this.title,
    required this.devices,
  });

  @override
  State<ExpandableDeviceSection> createState() =>
      _ExpandableDeviceSectionState();
}

class _ExpandableDeviceSectionState extends State<ExpandableDeviceSection> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
          onTap: () => setState(() => _isExpanded = !_isExpanded),
        ),
        if (_isExpanded)
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.devices.map((d) => DeviceCard(device: d)).toList(),
          ),
      ],
    );
  }
}

class DeviceCard extends StatelessWidget {
  final models.Device device;

  const DeviceCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    final values = device.lastParameterValues;

    final devicesProvider = Provider.of<DevicesProvider>(
      context,
      listen: false,
    );
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    Widget bottomBlock;
    switch (device.deviceTypeId) {
      case 1:
        bottomBlock = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text('Темп: ${values.mstemp?.round() ?? '-'}°C')),
            Flexible(child: Text('Влажн: ${values.mshum?.round() ?? '-'}%')),
          ],
        );
        break;
      case 6:
        bottomBlock = FutureBuilder<Uint8List>(
          future: devicesProvider.getLastSeismicSparklineImage(
            authProvider.token,
            device.deviceId.toInt(),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Text('Ошибка загрузки');
            } else if (snapshot.hasData) {
              return Image.memory(snapshot.data!, fit: BoxFit.cover);
            }
            return const Text('Нет данных');
          },
        );
        break;
      case 3:
        bottomBlock = buildSmartEcoBlock(device);
        break;
      case 14:
        bottomBlock = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text('CO₂: ${values.co2Flux?.toStringAsFixed(2) ?? '-'}'),
            ),
            Flexible(
              child: Text('H₂O: ${values.h2OFlux?.toStringAsFixed(2) ?? '-'}'),
            ),
          ],
        );
        break;
      case 17:
        bottomBlock = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Скорость: -- м/c'), Text('Заряд бат: -- Ач')],
        );
        break;
      default:
        bottomBlock = const Text("Нет данных");
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => ChangeNotifierProvider(
                  create: (_) => getIt<DeviceDetailsProvider>(), // Или
                  child: DeviceDetailsPage(
                    deviceId: device.deviceId.toInt(),
                    deviceName: device.name,
                    locationDescription: device.locationDescription,
                  ),
                ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок и серийный номер
              Row(
                children: [
                  Expanded(
                    child: Text(
                      device.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 4),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 100),
                    child: Text(
                      device.serialNumber ?? "--",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Text(
                device.locationDescription,
                style: const TextStyle(color: Colors.green),
              ),
              const SizedBox(height: 8),

              // Центральный блок — без обрезки
              bottomBlock,

              const Spacer(),

              // Время последнего обновления
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    device.lastUpdateDatetime ?? "--",
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSmartEcoBlock(models.Device device) {
    final values = device.lastParameterValues;

    Widget row(List<String> texts) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: texts.map((text) => Expanded(child: Text(text))).toList(),
      );
    }

    switch (device.moduleTypeId) {
      case 0:
        return row([
          'Темп: ${values.airTemp?.round() ?? '-'}°C',
          'Влажн: ${values.airHum?.round() ?? '-'}%',
        ]);
      case 1:
        return row([
          'Темп: ${values.temp?.round() ?? '-'}°C',
          'Влажн: ${values.hum?.round() ?? '-'}%',
        ]);
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Пыль: ${values.pm1?.round() ?? '-'} ppm'),
            Text('Шум: ${values.dbAvg?.round() ?? '-'} дБ'),
            Text('Темп: ${values.temp?.round() ?? '-'}°'),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Толщина: ${values.thickWood?.toStringAsFixed(2) ?? '-'} мм'),
            Text('Темп: ${values.trunkTemp?.round() ?? '-'}°C'),
            Text('NDVI: ${values.ndvi?.toStringAsFixed(2) ?? '-'}'),
          ],
        );
      case 4:
      case 5:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Т.В.: ${values.airTemp?.round() ?? '-'}°'),
            Text('Т.П.: ${values.soilTemp?.round() ?? '-'}°'),
            Text('В.П.: ${values.soilHum?.round() ?? '-'}'),
          ],
        );
      case 6:
      case 7:
        return row([
          'Т.В.: ${values.airTemp?.round() ?? '-'}°',
          'Влажн.: ${values.hum?.round() ?? '-'}%',
        ]);
      default:
        return const Text("Нет данных");
    }
  }
}
