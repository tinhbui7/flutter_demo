const Duration HTTP_TIMEOUT = const Duration(seconds: 30);

class ApiUrl {
  static const MOCK = 'http://localhost:3000';
  static const LOCAL = 'http://localhost:3000';
  static const DEV = 'https://devapi.clicksocial.network';
  static const QA = 'https://stagingapi.clicksocial.network';
  static const PROD = 'https://api.clicksocial.network';
}

class StatusCodes {
  static const UNKNOWN_ERROR = 0;
  static const SUCCESS = 1;
  static const ITEM_NOT_FOUND = 2;
  static const AUTH_ERROR = 3;
  static const MISSING_AUTH_TOKEN = 4;
  static const TOKEN_INVALID = 5;
  static const NOT_AUTHORIZED = 6;
  static const ACCOUNT_DUPLICATED = 11;
  static const USER_SUSPENDED = 13;
  static const NOT_CONVERSATION_MEMBER = 7;
  static const USER_UNAVAILABLE = 8;
  static const BAD_REPORTING_REQUEST = 9;
  static const NOT_ALLOWED_SEND_MESSAGE = 10;
  static const NETWORK_TIME_OUT = -1;
}
