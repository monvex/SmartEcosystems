abstract class Failure {
  final String errorMessage;
  final int? statusCode;

  Failure({required this.errorMessage, this.statusCode});
}

class DatabaseFailure extends Failure {
  DatabaseFailure({required super.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage, super.statusCode});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}
