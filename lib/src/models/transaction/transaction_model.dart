import 'package:transaction_management_app/src/core/utils/formatters.dart';

class TransactionModel {
  final String id;
  final String date;
  final String userId;
  final String amount;
  final String transactionType;
  final String category;

  const TransactionModel({
    required this.id,
    required this.date,
    required this.userId,
    required this.amount,
    required this.transactionType,
    required this.category,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['transactionId'].toString(),
        date: json['date'] ?? 'Date not found',
        userId: json['userId'].toString(),
        amount: json['amount'].toString(),
        transactionType:
            json['transactionType'] ?? 'Transaction Type not found',
        category: json['category'] ?? 'Category not found',
      );

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'userId': userId,
      'amount': amount,
      'transactionType': transactionType,
      'category': category,
    };
  }

  String get formattedDate {
    return Formatters.date(date);
  }

  String get formattedCurrency {
    return Formatters.currency(double.parse(amount));
  }
}
