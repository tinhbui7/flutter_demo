import 'base_exception.dart';

class FetchDataException extends BaseException {
  FetchDataException(
    String? message,
    String? url,
  ) : super('', message, url);

  @override
  String get name => 'FetchDataException';
}
