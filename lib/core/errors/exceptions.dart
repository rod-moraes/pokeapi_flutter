import 'failures.dart';

class ServerException implements Exception {
  final String message;

  ServerException({this.message = "Server Error"});
}

class LocalException implements Exception {
  final String message;

  LocalException({this.message = "Local Error"});
}

class LocalFailure extends Failure {
  const LocalFailure({String message = 'Local Error'})
      : super(message: message);
}

class ServerFailure extends Failure {
  const ServerFailure({String message = 'Server Error'})
      : super(message: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({String message = 'Network Error'})
      : super(message: message);
}
