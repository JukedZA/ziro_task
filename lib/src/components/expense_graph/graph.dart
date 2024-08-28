import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_management_app/src/components/custom/container/empty_list.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';
import 'package:transaction_management_app/src/core/utils/formatters.dart';

class MyLineChart extends StatelessWidget {
  final List<double> data;
  final List<String> titles;
  const MyLineChart({
    super.key,
    required this.data,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const EmptyList(title: 'No Data Found');
    }

    double maxValue = data.reduce(max);

    double chartHeight = maxValue * 1.5;

    return LineChart(
      LineChartData(
        backgroundColor: ThemeColors.background,
        maxX: data.length.toDouble(),
        minX: 0,
        maxY: chartHeight,
        minY: 0,
        gridData: const FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        lineTouchData: LineTouchData(
          getTouchedSpotIndicator:
              (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((spotIndex) {
              return TouchedSpotIndicatorData(
                const FlLine(
                  gradient: LinearGradient(
                    colors: [
                      AccentColors.teal,
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    stops: [0, 1, 1],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  strokeWidth: 30,
                ),
                FlDotData(
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 4,
                    color: ThemeColors.secondaryText,
                    strokeWidth: 6,
                    strokeColor: ThemeColors.containerOnBackground,
                  ),
                ),
              );
            }).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (touchedSpot) =>
                ThemeColors.background.withOpacity(0.8),
            getTooltipItems: (touchedSpots) => touchedSpots
                .map(
                  (barSpot) => LineTooltipItem(
                    Formatters.currency(data[barSpot.spotIndex]),
                    GoogleFonts.inter(
                      color: ThemeColors.primaryText,
                      fontSize: 14,
                      fontWeight: Weights.medium,
                    ),
                  ),
                )
                .toList(),
            tooltipRoundedRadius: 8,
          ),
        ),
        extraLinesData: ExtraLinesData(
          extraLinesOnTop: false,
          horizontalLines: [
            buildBottomLine(),
            buildHorizontalLine(chartHeight * 1 / 3),
            buildHorizontalLine(chartHeight * 2 / 3),
            buildHorizontalLine(chartHeight * 3 / 3),
          ],
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                String text = '';
                final int index = value.toInt();

                if (index >= 0 &&
                    index < titles.length &&
                    value == index.toDouble()) {
                  text = titles[index];
                }

                return Center(child: CustomText(text: text, size: 8));
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              getTitlesWidget: (value, meta) {
                String text;
                if (value.isNaN || value.isInfinite) {
                  text = '';
                } else {
                  text = value.toString();
                }

                return CustomText(text: text, size: 12);
              },
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              getTitlesWidget: (value, meta) {
                String text;
                if (value.isNaN || value.isInfinite) {
                  text = '';
                } else {
                  text = value.toString();
                }

                return CustomText(text: text, size: 12);
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: chartHeight * 1 / 3,
              getTitlesWidget: (value, meta) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HeadingText(
                      text: value < 1 ? '0' : Formatters.compactCurrency(value),
                      size: 8,
                      alignment: TextAlign.end,
                      weight: Weights.medium,
                    ),
                    const SizedBox(width: 8),
                  ],
                );
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            dotData: const FlDotData(show: false),
            spots: data.asMap().entries.map(
              (entry) {
                return FlSpot(entry.key.toDouble(), entry.value);
              },
            ).toList(),
            isCurved: true,
            gradient: const LinearGradient(
              colors: [
                AccentColors.purple,
                AccentColors.teal,
              ],
            ),
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              show: false,
            ),
          ),
        ],
      ),
    );
  }

  HorizontalLine buildHorizontalLine(double value) {
    return HorizontalLine(
        y: value, dashArray: [4, 4], color: ThemeColors.containerOnBackground);
  }

  HorizontalLine buildBottomLine() {
    return HorizontalLine(
      y: 0,
      color: ThemeColors.containerOnBackground,
    );
  }
}
