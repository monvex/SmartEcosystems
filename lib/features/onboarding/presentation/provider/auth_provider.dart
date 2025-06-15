import 'package:flutter/material.dart';
import 'package:smartecosystems/features/onboarding/domain/entity/login_data.dart';
import 'package:smartecosystems/features/onboarding/domain/entity/user.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/check_authentication_status_use_case.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/get_user_token_use_case.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/login_use_case.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/logout_use_case.dart';
import 'package:smartecosystems/features/onboarding/domain/use_case/registration_use_case.dart';

enum AuthStatus { initial, loading, authenticated, notauthenticated, error }

class AuthProvider with ChangeNotifier {
  final LoginUseCase loginUseCase;
  final RegistrationUseCase registrationUseCase;
  final LogoutUseCase logoutUseCase;
  final CheckAuthenticationStatusUseCase checkAuthenticationStatusUseCase;
  final GetUserTokenUseCase getUserTokenUseCase;

  AuthProvider({
    required this.loginUseCase,
    required this.registrationUseCase,
    required this.logoutUseCase,
    required this.checkAuthenticationStatusUseCase,
    required this.getUserTokenUseCase,
  });

  AuthStatus status = AuthStatus.initial;
  String token = "";
  String errorMessage = '';

  void checkAuthStatus() async {
    var authentication = await checkAuthenticationStatusUseCase();
    authentication.fold(
      (l) {
        status = AuthStatus.error;
        errorMessage = l.errorMessage;
        notifyListeners();
      },
      (r) async {
        if (r) {
          status = AuthStatus.authenticated;
          var result = await getUserTokenUseCase();
          result.fold(
            (l) {
              status = AuthStatus.error;
              errorMessage = l.errorMessage;
              notifyListeners();
            },
            (r) {
              errorMessage = '';
              token = r;
            },
          );
          errorMessage = '';
          notifyListeners();
        } else {
          status = AuthStatus.notauthenticated;
          errorMessage = '';
          notifyListeners();
        }
      },
    );
  }

  void logIn(LogInData logInData) async {
    status = AuthStatus.loading;
    notifyListeners();

    var result = await loginUseCase(logInData);

    result.fold(
      (l) {
        status = AuthStatus.error;
        errorMessage = l.errorMessage;
        notifyListeners();
      },
      (r) {
        status = AuthStatus.authenticated;
        errorMessage = '';
        notifyListeners();
      },
    );
  }

  void logOut() async {
    status = AuthStatus.loading;
    notifyListeners();

    var result = await logoutUseCase();

    result.fold(
      (l) {
        status = AuthStatus.error;
        errorMessage = l.errorMessage;
        notifyListeners();
      },
      (r) {
        status = AuthStatus.notauthenticated;
        errorMessage = '';
        notifyListeners();
      },
    );
  }

  void register(User user) async {
    status = AuthStatus.loading;
    notifyListeners();

    var result = await registrationUseCase(user);

    result.fold(
      (l) {
        status = AuthStatus.error;
        errorMessage = l.errorMessage;
        notifyListeners();
      },
      (r) {
        status = AuthStatus.authenticated;
        errorMessage = '';
        notifyListeners();
      },
    );
  }
}
