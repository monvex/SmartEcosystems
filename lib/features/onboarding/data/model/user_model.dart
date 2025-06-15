import 'package:smartecosystems/features/onboarding/domain/entity/user.dart';

class UserModel extends User {
  final String phone;
  final String secondName;
  final String userName;

  UserModel({
    required this.phone,
    required this.secondName,
    required this.userName,
    required super.email,
    required super.idUser,
    required super.isSendEmailsNotDevicesLink,
    required super.name,
    required super.organization,
    required super.userPasswordHash,
  });

  Map<String, dynamic> toJson() {
    return {
      "user": {
        'email': email,
        'id_user': idUser,
        'is_send_emails_not_devices_link': isSendEmailsNotDevicesLink,
        'name': name,
        'organization': organization,
        'phone': phone,
        'second_name': secondName,
        'user_name': userName,
        'user_password_hash': userPasswordHash,
      },
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      idUser: json['id_user'],
      isSendEmailsNotDevicesLink: json['is_send_emails_not_devices_link'],
      name: json['name'],
      organization: json['organization'],
      phone: json['phone'],
      secondName: json['second_name'],
      userName: json['user_name'],
      userPasswordHash: json['user_password_hash'],
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      phone: "",
      secondName: "",
      userName: "",
      email: user.email,
      idUser: user.idUser,
      isSendEmailsNotDevicesLink: user.isSendEmailsNotDevicesLink,
      name: user.name,
      organization: user.organization,
      userPasswordHash: user.userPasswordHash,
    );
  }
}
