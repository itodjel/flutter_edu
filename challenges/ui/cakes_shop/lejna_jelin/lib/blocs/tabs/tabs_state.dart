enum TabsStateStatus {
  loading,
  loaded,
}

class TabsState {
  int index;
  String imgPath;
  TabsStateStatus status;
  TabsState(
      {this.index, this.imgPath = 'assets/images/cake_1.png', this.status});

  TabsState copyWith({TabsStateStatus status}) {
    return TabsState(status: status ?? this.status);
  }
}
