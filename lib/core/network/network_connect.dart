import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkConnect {
  Future<bool> get isConnected;
}

class NetworkConnectImpl implements NetworkConnect {
  final InternetConnectionCheckerPlus connectivity;

  NetworkConnectImpl(this.connectivity);

  @override
  Future<bool> get isConnected async => await connectivity.hasConnection;
}
