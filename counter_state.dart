abstract class CounterState{
final int? number;
CounterState(this.number);
} 

class CounterLoading extends CounterState{
  CounterLoading(super.number);
}

class CounterInitial extends CounterState{
  CounterInitial():super(0);
}
class CounterCounted extends CounterState{
  CounterCounted(super.number);
}
class CounterError extends CounterState{
  final String message;
  CounterError(this.message, super.number) ;
}               