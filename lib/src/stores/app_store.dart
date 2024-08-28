import 'package:mobx/mobx.dart';
import 'package:transaction_management_app/src/core/utils/shared_helper.dart';
import 'package:transaction_management_app/src/models/user/user_model.dart';
import 'package:transaction_management_app/src/services/api_caller.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  UserModel? currentUser;

  @observable
  bool isLoading = false;

  @computed
  bool get isLoggedIn => currentUser != null;

  @action
  void initUser(UserModel? user) {
    currentUser = user;
  }

  @action
  Future<void> login(email, pass, context) async {
    isLoading = true;

    UserModel? user = await ApiCaller.login(
      email: email,
      password: pass,
    );

    initUser(user);

    isLoading = false;
  }

  @action
  void signOut() {
    SharedHelper.logout();

    initUser(null);
  }
}
