import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transaction_management_app/main.dart';
import 'package:transaction_management_app/src/models/transaction/transaction_model.dart';
import 'package:transaction_management_app/src/models/user/user_model.dart';
import 'package:transaction_management_app/src/services/api_routes.dart';

enum RequestTypes { selectAll, selectById, delete, login, custom }

class ApiCaller {
  static Map<String, String> _buildBody(RequestTypes type,
      {String? id, String? custom}) {
    String request = '';
    id = id ?? '';
    custom = custom ?? '';

    switch (type) {
      case RequestTypes.login:
        request = 'select=*&email=eq.$id';
      case RequestTypes.selectAll:
        request = 'select=*';
        break;
      case RequestTypes.selectById:
        request = 'select=*&id=eq.$id';
        break;
      case RequestTypes.delete:
        request = 'id=eq.$id';
      case RequestTypes.custom:
        request = custom;
        break;
      default:
    }

    return {
      "sql": request,
    };
  }

  static Map<String, String> _buildHeader(String table) {
    return {
      "FlowAuthorization": ApiRoutes.authKey,
      "Table": table,
    };
  }

  // TRANSACTIONS

  static Future<bool> deleteTransaction(String id) async {
    Uri url = Uri.parse(ApiRoutes.delete);

    try {
      final response = await http.post(
        url,
        headers: _buildHeader("Transactions"),
        body: {"sql": "transactionId=eq.$id"},
      );

      debugPrint('DELETE TRANSACTION: ${response.body}');

      return response.statusCode == 200;
    } catch (e) {
      debugPrint('DELETE TRANSACTIONS ERROR: ${e.toString()}');
      return false;
    }
  }

  static Future<bool> editTransaction(
      Map<String, dynamic> req, String id) async {
    Uri url = Uri.parse(ApiRoutes.update);

    Map<String, String> headers = _buildHeader("Transactions");
    headers['searchParameter'] = 'transactionId=eq.$id';

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(req),
      );

      debugPrint('UPDATE TRANSACTION: ${response.body}');

      return response.statusCode == 200;
    } catch (e) {
      debugPrint('UPDATE TRANSACTIONS ERROR: ${e.toString()}');
      return false;
    }
  }

  static Future<bool> createTransaction(Map<String, dynamic> req) async {
    Uri url = Uri.parse(ApiRoutes.insert);

    try {
      final response = await http.post(
        url,
        headers: _buildHeader("Transactions"),
        body: jsonEncode(req),
      );

      debugPrint('CREATE TRANSACTION: ${response.body}');

      return response.statusCode == 200;
    } catch (e) {
      debugPrint('CREATE TRANSACTIONS ERROR: ${e.toString()}');
      return false;
    }
  }

  static Future<List<TransactionModel>> getTransactions() async {
    Uri url = Uri.parse(ApiRoutes.select);

    try {
      final response = await http.post(
        url,
        headers: _buildHeader("Transactions"),
        body: _buildBody(
          RequestTypes.custom,
          custom: 'select=*&userId=eq.${appStore.currentUser!.id.toString()}',
        ),
      );

      debugPrint('GET TRANSACTIONS: ${response.body}');

      Iterable list = jsonDecode(response.body);

      return list.map((json) => TransactionModel.fromJson(json)).toList();
    } catch (e) {
      debugPrint('GET TRANSACTIONS ERROR: ${e.toString()}');
      return [];
    }
  }

  // LOGIN

  static Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse(ApiRoutes.select);

    try {
      final response = await http.post(
        url,
        headers: _buildHeader("Users"),
        body: _buildBody(
          RequestTypes.login,
          id: email,
        ),
      );

      debugPrint('GET USER: ${response.body}');

      Iterable list = jsonDecode(response.body);

      if (list.isEmpty) {
        return null;
      }

      return UserModel.fromJson(list.first);
    } catch (e) {
      debugPrint('GET USER ERROR: ${e.toString()}');
      return null;
    }
  }
}
