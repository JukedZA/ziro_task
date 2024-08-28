import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transaction_management_app/src/components/custom/buttons/box_button.dart';
import 'package:transaction_management_app/src/components/expense_graph/graph.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';
import 'package:transaction_management_app/src/stores/transaction_store.dart';

class ChartContainer extends StatelessWidget {
  final TransactionStore store;
  const ChartContainer({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BoxButton(
                text: 'Income',
                onTap: () {
                  store.toggleGraphState(GraphState.income);
                },
                color: store.graphState == GraphState.income
                    ? AccentColors.purple
                    : null,
              ),
              const SizedBox(width: 16),
              BoxButton(
                text: 'Expenses',
                onTap: () {
                  store.toggleGraphState(GraphState.expense);
                },
                color: store.graphState == GraphState.expense
                    ? AccentColors.purple
                    : null,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const HeadingText(text: 'Monthly Expenses'),
          const SizedBox(height: 16),
          Container(
            height: 150,
            padding: const EdgeInsets.only(right: 16),
            child: MyLineChart(
              data: store.graphData.values.toList(),
              titles: store.graphData.keys.toList(),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BoxButton(
                text: 'Week',
                onTap: () {
                  store.toggleGraphFilter(GraphFilter.week);
                },
                color: store.graphFilter == GraphFilter.week
                    ? AccentColors.purple
                    : null,
              ),
              BoxButton(
                text: 'Month',
                onTap: () {
                  store.toggleGraphFilter(GraphFilter.month);
                },
                color: store.graphFilter == GraphFilter.month
                    ? AccentColors.purple
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
