import 'base_exception.dart';

class UnAuthenticatedException extends BaseException {
  UnAuthenticatedException(String? message, String? url)
      : super(
          '',
          message,
          url,
        );

  @override
  String get name => 'UnAuthenticatedException';
}
