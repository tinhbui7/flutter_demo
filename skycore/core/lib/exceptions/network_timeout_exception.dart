import 'base_exception.dart';

class NetworkTimeoutException extends BaseException {
  NetworkTimeoutException(String url)
      : super(
          '',
          '',
          url,
        );

  @override
  String get name => 'NetworkTimeoutException';
}
