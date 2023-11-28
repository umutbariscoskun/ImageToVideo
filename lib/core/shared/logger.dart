import 'dart:developer' as developer;

void logError(String msg, [StackTrace? stackTrace]) {
  developer.log('\x1B[31m$msg\x1B[0m', stackTrace: stackTrace);
}

void logInfo(String msg) {
  developer.log('\x1B[32m$msg\x1B[0m');
}

void logSuccess(String msg) {
  developer.log('\x1B[32m$msg\x1B[0m');
}
