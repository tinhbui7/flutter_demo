import 'base_exception.dart';

class MissingTokenException extends BaseException {
  MissingTokenException(String? message, String? url)
      : super(
          '',
          message,
          url,
        );

  @override
  String get name => 'MissingTokenException';
}
