class Transaction {
  final String amount;
  final String date;
  final String reference;
  final String currency;
  final String email;

  Transaction({
    required this.amount,
    required this.date,
    required this.reference,
    required this.currency,
    required this.email,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      amount: json['amount'],
      date: json['date'],
      reference: json['reference'],
      currency: json['currency'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'date': date,
        'reference': reference,
        'currency': currency,
        'email': email,
      };
}
