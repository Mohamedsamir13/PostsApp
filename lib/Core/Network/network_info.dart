import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
 Future<bool> get IsConnected;

}
class NetworkImpl implements NetworkInfo{
  final InternetConnectionChecker connectionChecker;

  NetworkImpl(this.connectionChecker);
  @override
  Future<bool> get IsConnected => connectionChecker.hasConnection;
}