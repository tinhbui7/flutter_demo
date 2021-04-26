class ResponseModel {
  final int? status;
  final String? message;
  final dynamic? data;

  ResponseModel(this.status, this.message, this.data);

  factory ResponseModel.fromJson(Map<String, dynamic> map) {
    var msg = map['message'];
    return ResponseModel(
      map['statusCode'],
      msg is String ? msg : (msg?.toString() ?? '$msg'),
      map['contractData'],
    );
  }
}
