import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';

class EmptyList extends StatelessWidget {
  final String title;
  final bool isNotOutlined;
  final double? height;
  final Color fillColor;
  final Color? backgroundColor;
  const EmptyList({
    super.key,
    required this.title,
    this.fillColor = Colors.transparent,
    this.backgroundColor,
    this.height = 200,
    this.isNotOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: isNotOutlined
            ? null
            : Border.all(
                color: backgroundColor ?? ThemeColors.containerOnBackground),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor:
                backgroundColor ?? ThemeColors.containerOnBackground,
            child: Icon(
              Icons.search_rounded,
              color: ThemeColors.secondaryIcon,
            ),
          ),
          const SizedBox(height: 16),
          CustomText(
            text: title,
            size: 14,
            color: ThemeColors.primaryText,
          ),
        ],
      ),
    );
  }
}
