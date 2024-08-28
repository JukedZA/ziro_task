import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';
import 'package:transaction_management_app/src/core/utils/extensions.dart';

class NavItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final Color? customSelectionColor;
  final bool iconOnly;
  final void Function()? onTap;
  const NavItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.onTap,
    this.customSelectionColor,
    this.iconOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isSelected ? 100 : null,
      duration: const Duration(milliseconds: 250),
      padding: iconOnly
          ? const EdgeInsets.all(8)
          : const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? customSelectionColor ?? AccentColors.purple
            : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: iconOnly
          ? Icon(
              isSelected ? selectedIcon : unselectedIcon,
              color: ThemeColors.primaryIcon,
            )
          : Row(
              children: [
                Icon(
                  isSelected ? selectedIcon : unselectedIcon,
                  color: ThemeColors.primaryIcon,
                ),
                isSelected
                    ? CustomText(
                        text: title,
                        size: 12,
                      ).paddingOnly(left: 6)
                    : const SizedBox(),
              ],
            ),
    ).onTap(onTap);
  }
}
