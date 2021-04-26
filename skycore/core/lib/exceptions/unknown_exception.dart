import 'base_exception.dart';

class UnknownException extends BaseException {
  UnknownException(String? message, String? url)
      : super(
          '',
          message,
          url,
        );

  @override
  String get name => 'UnknownException';
}
