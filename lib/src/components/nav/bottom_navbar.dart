import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:transaction_management_app/src/components/nav/nav_item.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final void Function(int index) onTap;
  const BottomNavBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: ThemeColors.containerOnBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavItem(
            isSelected: index == 0,
            title: 'Home',
            selectedIcon: IconlyBold.home,
            unselectedIcon: IconlyLight.home,
            onTap: () {
              onTap(0);
            },
          ),
          const SizedBox(width: 8),
          NavItem(
            isSelected: index == 1,
            title: 'Wallet',
            selectedIcon: IconlyBold.wallet,
            unselectedIcon: IconlyLight.wallet,
            onTap: () {
              onTap(1);
            },
          ),
          const SizedBox(width: 8),
          NavItem(
            isSelected: index == 2,
            title: '',
            selectedIcon: Icons.abc,
            unselectedIcon: Icons.abc,
            iconOnly: true,
            customSelectionColor: AccentColors.teal,
            onTap: () {
              onTap(2);
            },
          ),
          const SizedBox(width: 8),
          NavItem(
            isSelected: index == 3,
            title: 'Scan',
            selectedIcon: IconlyBold.scan,
            unselectedIcon: IconlyLight.scan,
            onTap: () {
              onTap(3);
            },
          ),
          const SizedBox(width: 8),
          NavItem(
            isSelected: index == 4,
            title: 'Profile',
            selectedIcon: IconlyBold.profile,
            unselectedIcon: IconlyLight.profile,
            onTap: () {
              onTap(4);
            },
          ),
        ],
      ),
    );
  }
}
