import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = PageStoreBase with _$PageStore;

abstract class PageStoreBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void changePage(int index) {
    currentIndex = index;
  }
}
