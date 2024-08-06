import 'package:bloc/bloc.dart';
import 'package:todo_cubit/logic/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() async {
    emit(CounterLoading(state.number));

    await Future.delayed(const Duration(seconds: 2));
    emit(CounterError("something is wrong", state.number));
    emit(CounterCounted(state.number! + 1));
  }

  void decrement() async {
    emit(CounterLoading(state.number));

    await Future.delayed(const Duration(seconds: 2));

    emit(CounterCounted(state.number! - 1));
  }
}
