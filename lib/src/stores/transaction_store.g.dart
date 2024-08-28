// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionStore on TransactionStoreBase, Store {
  Computed<Map<String, double>>? _$graphDataComputed;

  @override
  Map<String, double> get graphData => (_$graphDataComputed ??=
          Computed<Map<String, double>>(() => super.graphData,
              name: 'TransactionStoreBase.graphData'))
      .value;
  Computed<double>? _$balanceComputed;

  @override
  double get balance =>
      (_$balanceComputed ??= Computed<double>(() => super.balance,
              name: 'TransactionStoreBase.balance'))
          .value;

  late final _$graphStateAtom =
      Atom(name: 'TransactionStoreBase.graphState', context: context);

  @override
  GraphState get graphState {
    _$graphStateAtom.reportRead();
    return super.graphState;
  }

  @override
  set graphState(GraphState value) {
    _$graphStateAtom.reportWrite(value, super.graphState, () {
      super.graphState = value;
    });
  }

  late final _$graphFilterAtom =
      Atom(name: 'TransactionStoreBase.graphFilter', context: context);

  @override
  GraphFilter get graphFilter {
    _$graphFilterAtom.reportRead();
    return super.graphFilter;
  }

  @override
  set graphFilter(GraphFilter value) {
    _$graphFilterAtom.reportWrite(value, super.graphFilter, () {
      super.graphFilter = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'TransactionStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$selectedTransactionAtom =
      Atom(name: 'TransactionStoreBase.selectedTransaction', context: context);

  @override
  TransactionModel? get selectedTransaction {
    _$selectedTransactionAtom.reportRead();
    return super.selectedTransaction;
  }

  @override
  set selectedTransaction(TransactionModel? value) {
    _$selectedTransactionAtom.reportWrite(value, super.selectedTransaction, () {
      super.selectedTransaction = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: 'TransactionStoreBase.selectedDate', context: context);

  @override
  DateTime? get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime? value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$selectedTransactionTypeAtom = Atom(
      name: 'TransactionStoreBase.selectedTransactionType', context: context);

  @override
  String? get selectedTransactionType {
    _$selectedTransactionTypeAtom.reportRead();
    return super.selectedTransactionType;
  }

  @override
  set selectedTransactionType(String? value) {
    _$selectedTransactionTypeAtom
        .reportWrite(value, super.selectedTransactionType, () {
      super.selectedTransactionType = value;
    });
  }

  late final _$transactionsAtom =
      Atom(name: 'TransactionStoreBase.transactions', context: context);

  @override
  List<TransactionModel> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(List<TransactionModel> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  late final _$getTransactionsAsyncAction =
      AsyncAction('TransactionStoreBase.getTransactions', context: context);

  @override
  Future<void> getTransactions() {
    return _$getTransactionsAsyncAction.run(() => super.getTransactions());
  }

  late final _$createTransactionAsyncAction =
      AsyncAction('TransactionStoreBase.createTransaction', context: context);

  @override
  Future<bool> createTransaction(Map<String, dynamic> req) {
    return _$createTransactionAsyncAction
        .run(() => super.createTransaction(req));
  }

  late final _$TransactionStoreBaseActionController =
      ActionController(name: 'TransactionStoreBase', context: context);

  @override
  void toggleGraphState(GraphState state) {
    final _$actionInfo = _$TransactionStoreBaseActionController.startAction(
        name: 'TransactionStoreBase.toggleGraphState');
    try {
      return super.toggleGraphState(state);
    } finally {
      _$TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleGraphFilter(GraphFilter filter) {
    final _$actionInfo = _$TransactionStoreBaseActionController.startAction(
        name: 'TransactionStoreBase.toggleGraphFilter');
    try {
      return super.toggleGraphFilter(filter);
    } finally {
      _$TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
graphState: ${graphState},
graphFilter: ${graphFilter},
isLoading: ${isLoading},
selectedTransaction: ${selectedTransaction},
selectedDate: ${selectedDate},
selectedTransactionType: ${selectedTransactionType},
transactions: ${transactions},
graphData: ${graphData},
balance: ${balance}
    ''';
  }
}
