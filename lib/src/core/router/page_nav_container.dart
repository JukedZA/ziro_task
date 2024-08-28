import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transaction_management_app/main.dart';
import 'package:transaction_management_app/src/components/nav/bottom_navbar.dart';
import 'package:transaction_management_app/src/core/utils/extensions.dart';
import 'package:transaction_management_app/src/models/user/user_model.dart';
import 'package:transaction_management_app/src/pages/auth/login_page.dart';
import 'package:transaction_management_app/src/pages/home/home.dart';
import 'package:transaction_management_app/src/pages/placeholder/placeholder_page.dart';
import 'package:transaction_management_app/src/pages/profile/profile_page.dart';
import 'package:transaction_management_app/src/stores/page_store.dart';

class PageNavContainer extends StatefulWidget {
  const PageNavContainer({
    super.key,
  });

  @override
  State<PageNavContainer> createState() => _PageNavContainerState();
}

class _PageNavContainerState extends State<PageNavContainer> {
  final PageStore _store = PageStore();

  final List<Widget> _pages = [
    const HomeScreen(),
    const PlaceholderPage(),
    const PlaceholderPage(),
    const PlaceholderPage(),
    const ProfilePage(),
  ];

  void _changePage(int index) {
    _store.changePage(index);
  }

  Future<void> _redirect(user) async {
    if (user == null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        const LoginPage().launch(context, isNewTask: true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (_) {
        final UserModel? user = appStore.currentUser;

        _redirect(user);

        return Scaffold(
          body: _pages[_store.currentIndex],
          bottomNavigationBar: BottomNavBar(
            index: _store.currentIndex,
            onTap: _changePage,
          ),
        );
      }),
    );
  }
}
