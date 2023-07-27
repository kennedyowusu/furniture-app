import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furniture_ui/constants/colors.dart';
import 'package:furniture_ui/model/paystack_response.dart';
import 'package:furniture_ui/model/transaction.dart';
import 'package:furniture_ui/services/api_key.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentView extends StatelessWidget {
  PaymentView({
    super.key,
    required this.amount,
    required this.email,
    required this.reference,
  });

  final String amount;
  final String email;
  final String reference;

  final String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final Dio dio = Dio();

  Future<PaystackTransactionModel> createTransaction(
    Transaction transaction,
  ) async {
    const String url = 'https://api.paystack.co/transaction/initialize';
    final Map<String, String> data = {
      'amount': transaction.amount,
      'email': transaction.email,
      'reference': transaction.reference,
      'currency': transaction.currency,
      'date': transaction.date,
    };

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $apiKey',
          },
          method: 'POST',
        ),
        data: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.data);
        debugPrint(responseJson.toString());
        return PaystackTransactionModel.fromJson(responseJson['data']);
      } else {
        throw Exception('Failed to make payment');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> initializeTransaction() async {
    try {
      final Transaction transaction = Transaction(
        amount: amount,
        email: email,
        reference: reference,
        date: date,
        currency: "GHS",
      );

      final PaystackTransactionModel response =
          await createTransaction(transaction);

      if (response.data.authorizationUrl.isNotEmpty) {
        return response.data.authorizationUrl;
      } else {
        throw Exception('Failed to make payment');
      }
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: FutureBuilder(
            future: initializeTransaction(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                final String? url = snapshot.data;
                return WebViewWidget(
                  controller: WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setBackgroundColor(const Color(0x00000000))
                    ..setNavigationDelegate(
                      NavigationDelegate(
                        onProgress: (int progress) {
                          debugPrint(
                              'WebView is loading (progress : $progress%)');
                        },
                        onPageStarted: (String url) {},
                        onPageFinished: (String url) {},
                        onWebResourceError: (WebResourceError error) {},
                        onNavigationRequest: (NavigationRequest request) {
                          if (request.url.startsWith('')) {
                            return NavigationDecision.prevent;
                          }
                          return NavigationDecision.navigate;
                        },
                      ),
                    )
                    ..loadRequest(
                      Uri.parse(
                        '$url',
                      ),
                    ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error}',
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
