import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:transaction_management_app/src/models/transaction/transaction_model.dart';
import 'package:transaction_management_app/src/services/api_caller.dart';

part 'transaction_store.g.dart';

enum GraphState { income, expense }

enum GraphFilter { day, week, month }

class TransactionStore = TransactionStoreBase with _$TransactionStore;

abstract class TransactionStoreBase with Store {
  DateFormat apiFormatter = DateFormat('yyyy-MM-dd');

  @observable
  GraphState graphState = GraphState.expense;

  @observable
  GraphFilter graphFilter = GraphFilter.month;

  @observable
  bool isLoading = false;

  @observable
  DateTime? selectedDate;

  @observable
  String? selectedTransactionType;

  @observable
  List<TransactionModel> transactions = ObservableList<TransactionModel>();

  @computed
  Map<String, double> get graphData {
    final Map<String, double> result = {};

    final filteredTransactions = _sortTransactions();

    if (graphFilter == GraphFilter.month) {
      result.addAll(_groupByMonth(filteredTransactions));
    } else if (graphFilter == GraphFilter.week) {
      result.addAll(_groupByWeek(filteredTransactions));
    }

    return result;
  }

  @computed
  double get balance {
    final double totalIncome = _getTotalAmount('Incoming');

    final double totalExpense = _getTotalAmount('Outgoing');

    return totalIncome - totalExpense;
  }

  void init() {
    getTransactions();
  }

  @action
  void toggleGraphState(GraphState state) {
    graphState = state;
  }

  @action
  toggleGraphFilter(GraphFilter filter) {
    graphFilter = filter;
  }

  @action
  Future<void> getTransactions() async {
    isLoading = true;

    final List<TransactionModel> items = await ApiCaller.getTransactions();

    if (items.isNotEmpty) {
      transactions = ObservableList<TransactionModel>();
      transactions.addAll(items);
    } else {
      transactions = ObservableList<TransactionModel>();
    }

    isLoading = false;
  }

  @action
  Future<bool> createTransaction(Map<String, dynamic> req) async {
    isLoading = true;

    final bool success = await ApiCaller.createTransaction(req);

    if (success) {
      getTransactions();
    }

    isLoading = false;

    return success;
  }

  double _getTotalAmount(String transactionType) {
    final List<TransactionModel> list = transactions
        .where(
          (transaction) => transaction.transactionType == transactionType,
        )
        .toList();

    return list.fold(
      0.0,
      (sum, transaction) => sum + double.parse(transaction.amount),
    );
  }

  List<TransactionModel> _sortTransactions() {
    final filteredTransactions = transactions.where((transaction) {
      if (graphState == GraphState.expense) {
        return transaction.transactionType == "Outgoing";
      } else if (graphState == GraphState.income) {
        return transaction.transactionType == "Incoming";
      }
      return false;
    }).toList();

    filteredTransactions.sort(
      (a, b) {
        final dateA = DateTime.parse(a.date);
        final dateB = DateTime.parse(b.date);
        return dateA.compareTo(dateB);
      },
    );

    return filteredTransactions;
  }

  Map<String, double> _groupByMonth(
      List<TransactionModel> filteredTransactions) {
    final Map<String, double> monthlyTotals = {};

    for (final transaction in filteredTransactions) {
      final DateTime now = DateTime.now();
      final DateTime date = DateTime.parse(transaction.date);

      if (now.year == date.year) {
        final String month = DateFormat('MMM').format(date);

        if (!monthlyTotals.containsKey(month)) {
          monthlyTotals[month] = 0;
        }

        monthlyTotals[month] =
            monthlyTotals[month]! + double.parse(transaction.amount);
      }
    }

    return monthlyTotals;
  }

  Map<String, double> _groupByWeek(
      List<TransactionModel> filteredTransactions) {
    final Map<String, double> weeklyTotals = {};
    final today = DateTime.now();
    final startOfLastWeek = today.subtract(const Duration(days: 7));

    for (var transaction in filteredTransactions) {
      final date = DateFormat('yyyy-MM-dd').parse(transaction.date);

      // Check if the transaction is within the last 7 days
      if (date.isAfter(startOfLastWeek.subtract(const Duration(days: 1))) &&
          date.isBefore(today.add(const Duration(days: 1)))) {
        final week = DateFormat('EEE').format(date);

        if (!weeklyTotals.containsKey(week)) {
          weeklyTotals[week] = 0;
        }

        weeklyTotals[week] =
            weeklyTotals[week]! + double.parse(transaction.amount);
      }
    }

    return weeklyTotals;
  }

  // IRRELEVANT FUNCTION API DOES NOT RETURN TIME
  // Map<String, double> _groupByDay(List<TransactionModel> filteredTransactions) {
  //   final Map<String, double> dailyTotals = {};

  //   for (var transaction in filteredTransactions) {
  //     final DateTime now = DateTime.now();
  //     final date = DateTime.parse(transaction.date);

  //     if (date.day == now.day &&
  //         date.month == now.month &&
  //         date.year == now.year) {
  //       final time = DateFormat('hh:mm a').format(date);

  //       if (!dailyTotals.containsKey(time)) {
  //         dailyTotals[time] = 0;
  //       }

  //       dailyTotals[time] =
  //           dailyTotals[time]! + double.parse(transaction.amount);
  //     }
  //   }

  //   print(dailyTotals.toString());

  //   return dailyTotals;
  // }
}
