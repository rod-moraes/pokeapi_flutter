import 'failures.dart';

class ServerException implements Exception {
  final String message;

  ServerException({this.message = "Server Error"});
}

class ServerFailure extends Failure {
  const ServerFailure({String message = 'Server Error'})
      : super(message: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({String message = 'Network Error'})
      : super(message: message);
}
