abstract class BaseException implements Exception {
  final code;
  final String? message;
  final String? url;

  BaseException(this.code, this.message, this.url);

  String get name;

  @override
  String toString() {
    return {
      'name': name,
      'code': code?.toString(),
      'message': message,
      'url': url,
    }.toString();
  }
}
