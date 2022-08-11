import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(kolicina: 0)) {
    on<PovecajEvent>(_povecaj);
    on<SmanjiEvent>(_smanji);
  }

  Future _povecaj(PovecajEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(kolicina: (state.kolicina + 1)));
  }

  Future _smanji(SmanjiEvent event, Emitter<CounterState> emit) async {
    if (state.kolicina <= 0) {
      return;
    }
    emit(state.copyWith(kolicina: (state.kolicina - 1)));
  }
}
