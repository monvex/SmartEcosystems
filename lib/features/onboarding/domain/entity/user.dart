class User {
  final String email;
  final int idUser;
  final int isSendEmailsNotDevicesLink;
  final String name;
  final String organization;
  final String userPasswordHash;

  User({
    required this.email,
    required this.idUser,
    required this.isSendEmailsNotDevicesLink,
    required this.name,
    required this.organization,
    required this.userPasswordHash,
  });
}
