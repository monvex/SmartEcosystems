import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartecosystems/core/presentation/page/main_page.dart';
import 'package:smartecosystems/features/onboarding/domain/entity/login_data.dart';
import 'package:smartecosystems/features/onboarding/presentation/provider/auth_provider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, provider, widget) {
          if (provider.status == AuthStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.status == AuthStatus.error) {
            return const OnboardingScreen();
          }

          if (provider.status == AuthStatus.initial ||
              provider.status == AuthStatus.notauthenticated) {
            return const OnboardingScreen();
          }
          if (provider.status == AuthStatus.authenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            });
          }

          return const SizedBox(); // fallback
        },
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Авторизация',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Пароль'),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              final authProvider = Provider.of<AuthProvider>(
                context,
                listen: false,
              );

              authProvider.logIn(
                LogInData(
                  login: emailController.text,
                  password: passwordController.text,
                ),
              );

              final message = switch (authProvider.status) {
                AuthStatus.authenticated => 'Авторизация успешна!',
                AuthStatus.error => 'Ошибка: ${authProvider.errorMessage}',
                _ => null,
              };

              if (message != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            child: const Text('Авторизоваться'),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Функция регистрации пока не реализована'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text.rich(
              TextSpan(
                text: 'Нет аккаунта? ',
                children: [
                  TextSpan(
                    text: 'Зарегистрируйтесь',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
