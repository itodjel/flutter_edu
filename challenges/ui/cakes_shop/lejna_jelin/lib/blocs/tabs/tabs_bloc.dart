import 'dart:async';
import 'package:bloc/bloc.dart';

import 'all.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  TabsBloc() : super(TabsState(index: 1));

  @override
  Stream<TabsState> mapEventToState(TabsEvent event) async* {
    if (event is TabsChangeEvent) {
      yield* _change(event);
    }
  }

  Stream<TabsState> _change(TabsChangeEvent event) async* {
    yield state.copyWith(status: TabsStateStatus.loading);
    String imgPath = getImgPath(event.index);
    await Future.delayed(Duration(seconds: 1));
    yield state.copyWith(status: TabsStateStatus.loaded);
    yield TabsState(index: event.index, imgPath: imgPath);
  }

  String getImgPath(int index) {
    String imgPath;
    switch (index) {
      case 1:
        imgPath = 'assets/images/cake_1.png';
        break;
      case 2:
        imgPath = 'assets/images/cake_2.png';
        break;
      case 3:
        imgPath = 'assets/images/cake_3.png';
        break;
      case 4:
        imgPath = 'assets/images/cake_4.png';
        break;
    }
    return imgPath;
  }
}
