import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transaction_management_app/src/components/custom/buttons/my_dropdown.dart';
import 'package:transaction_management_app/src/components/custom/buttons/wide_text_button.dart';
import 'package:transaction_management_app/src/components/custom/fields/my_form_field.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';
import 'package:transaction_management_app/src/core/utils/extensions.dart';
import 'package:transaction_management_app/src/core/utils/formatters.dart';
import 'package:transaction_management_app/src/models/transaction/transaction_model.dart';
import 'package:transaction_management_app/src/models/user/user_model.dart';
import 'package:transaction_management_app/src/stores/transaction_store.dart';

class CreateTransactionBody extends StatefulWidget {
  final UserModel user;
  final TransactionStore store;
  const CreateTransactionBody({
    super.key,
    required this.user,
    required this.store,
  });

  @override
  State<CreateTransactionBody> createState() => _CreateTransactionBodyState();
}

class _CreateTransactionBodyState extends State<CreateTransactionBody> {
  late TransactionStore _store;

  // NULL TO CREATE A NEW TASK || NOT NULL TO EDIT A TASK
  TransactionModel? _selectedTransaction;

  bool _isEditing = false;

  final FocusNode _amountNode = FocusNode();
  final FocusNode _dateNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final List<String> _transactionTypes = [
    'Outgoing',
    'Incoming',
  ];

  Future<bool> _editOrCreateTransaction() async {
    if (_amountController.text.trim().isEmpty ||
        _store.selectedDate == null ||
        _store.selectedTransactionType == null ||
        double.tryParse(_amountController.text) == null) {
      return false;
    }

    Map<String, dynamic> req = {
      "date": _store.apiFormatter.format(_store.selectedDate!),
      "userId": widget.user.id,
      "transactionType": _store.selectedTransactionType,
      "amount": double.parse(_amountController.text),
      "category": '',
    };

    if (_isEditing) {
      return await _store.editTransaction(req);
    } else {
      return await _store.createTransaction(req);
    }
  }

  @override
  void initState() {
    super.initState();

    _store = widget.store;

    _store.selectedTransactionType = null;
    _store.selectedDate = null;

    _selectedTransaction = _store.selectedTransaction;

    if (_selectedTransaction != null) {
      _initEditMode();
    }
  }

  void _initEditMode() {
    _isEditing = true;

    _amountController.text = _selectedTransaction!.amount;
    _dateController.text = _selectedTransaction!.date;

    _store.selectedDate = DateTime.parse(_selectedTransaction!.date);
    _store.selectedTransactionType = _selectedTransaction!.transactionType;
  }

  void _hideKeyboard(context) =>
      FocusScope.of(context).requestFocus(FocusNode());

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
        fieldHintText: 'Month/Date/Year',
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: ThemeColors.containerOnBackground)
                  .copyWith(surface: ThemeColors.background),
            ),
            child: child!,
          );
        },
        initialDate: now,
        firstDate: now.subtract(const Duration(days: 90)),
        lastDate: DateTime(2101));
    if (picked != null && picked != _store.selectedDate) {
      setState(() {
        _store.selectedDate = picked;
        _dateController.text = Formatters.dateTime(_store.selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingText(text: 'Create Transaction'),
                const SizedBox(height: 16),
                MyFormField(
                  focusNode: _dateNode,
                  controller: _dateController,
                  hint: 'Date',
                  onTap: () {
                    _hideKeyboard(context);
                    _showDatePicker(context);
                  },
                  onSaved: (String? value) {},
                  fontSize: 14,
                ),
                const SizedBox(height: 8),
                MyFormField(
                  focusNode: _amountNode,
                  controller: _amountController,
                  hint: 'Amount',
                  keyboardType: TextInputType.number,
                  onSaved: (String? value) {},
                  fontSize: 14,
                ),
                const SizedBox(height: 8),
                MyDropdown(
                  value: _store.selectedTransactionType,
                  hint: 'Transaction Type',
                  items: _transactionTypes
                      .map(
                        (String item) => DropdownMenuItem<String>(
                          value: item,
                          child: CustomText(
                            text: item,
                            size: 14,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (item) {
                    item as String;

                    _store.selectedTransactionType = item;
                  },
                ),
              ],
            ),
            WideTextButton(
              onTap: () async {
                bool success;

                success = await _editOrCreateTransaction();

                if (success && context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              text: _isEditing ? 'Confirm Edit' : 'Create Transaction',
              backgroundColor:
                  _store.isLoading ? ThemeColors.containerOnBackground : null,
              isLoading: _store.isLoading,
            ),
          ],
        ).onTap(() {
          _hideKeyboard(context);
        }),
      );
    });
  }
}
