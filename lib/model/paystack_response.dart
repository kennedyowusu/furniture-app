import 'dart:convert';

PaystackTransactionModel paystackTransactionModelFromJson(String str) =>
    PaystackTransactionModel.fromJson(json.decode(str));

String paystackTransactionModelToJson(PaystackTransactionModel data) =>
    json.encode(data.toJson());

class PaystackTransactionModel {
  bool status;
  String message;
  PayStackTransactionModel data;

  PaystackTransactionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PaystackTransactionModel.fromJson(Map<String, dynamic> json) =>
      PaystackTransactionModel(
        status: json["status"],
        message: json["message"],
        data: PayStackTransactionModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class PayStackTransactionModel {
  String authorizationUrl;
  String accessCode;
  String reference;

  PayStackTransactionModel({
    required this.authorizationUrl,
    required this.accessCode,
    required this.reference,
  });

  factory PayStackTransactionModel.fromJson(Map<String, dynamic> json) =>
      PayStackTransactionModel(
        authorizationUrl: json["authorization_url"],
        accessCode: json["access_code"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "authorization_url": authorizationUrl,
        "access_code": accessCode,
        "reference": reference,
      };
}
