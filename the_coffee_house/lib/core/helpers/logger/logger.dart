import 'package:the_coffee_house/core/helpers/logger/logger_i.dart';
import 'package:logger/logger.dart' as logger;

class Logger extends ILogger {
  final _logger = logger.Logger(
    printer: logger.PrettyPrinter(methodCount: 0),
  );

  Logger();

  @override
  log(String tag, data) =>
      _logger.log(logger.Level.info, '$tag: ${data?.toString()}');

  @override
  logError(String tag, data) =>
      _logger.log(logger.Level.error, '$tag: ${data?.toString()}');
}
