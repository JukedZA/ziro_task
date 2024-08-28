import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';

class MyDropdown extends StatelessWidget {
  final String? value;
  final String hint;
  final List<DropdownMenuItem> items;
  final void Function(dynamic value) onChanged;
  final List<Widget> Function(BuildContext context)? selectedBuilder;
  final bool isExpanded;
  final double maxHeight;
  const MyDropdown({
    super.key,
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.isExpanded = true,
    this.selectedBuilder,
    this.maxHeight = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: ThemeColors.containerOnBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton2(
        underline: const SizedBox(),
        isDense: true,
        isExpanded: isExpanded,
        hint: CustomText(
          text: hint,
          size: 14,
          color: ThemeColors.secondaryText,
          weight: Weights.reg,
        ),
        iconStyleData: IconStyleData(
          icon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: ThemeColors.secondaryIcon,
              size: 20,
            ),
          ),
        ),
        buttonStyleData: const ButtonStyleData(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: maxHeight,
          isOverButton: false,
          offset: const Offset(0, -24),
          openInterval: const Interval(0, 1, curve: Curves.decelerate),
          decoration: BoxDecoration(
            color: ThemeColors.containerOnBackground,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        selectedItemBuilder: selectedBuilder,
        items: items,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
