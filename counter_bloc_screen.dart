import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/bloc/counter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("object");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Bloc Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterLoading) {
                  return const CircularProgressIndicator();
                }

                return Text(
                  '${state.number}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              listener: (context, state) {
                if (state is CounterError) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Column(
                              children: [
                                Text(state.message),
                                Text(state.message),
                                 Text(state.message),
                              ],
                            ),
                          ));
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterDecrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncrement()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
