import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartecosystems/core/di/get_it.dart';
import 'package:smartecosystems/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:smartecosystems/features/onboarding/presentation/provider/auth_provider.dart';
import 'package:smartecosystems/features/devices/presentation/provider/devices_provider.dart';
import 'package:yandex_maps_mapkit/init.dart' as init;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init.initMapkit(apiKey: 'bdfe7aa7-ea96-430d-b26d-878820a5463d');
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => getIt<AuthProvider>()..checkAuthStatus(),
        ),
        ChangeNotifierProvider<DevicesProvider>(
          create: (_) => getIt<DevicesProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Smart Ecosystems',
        theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
        home: const OnboardingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
