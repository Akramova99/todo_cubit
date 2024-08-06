
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/counter/counter_cubit.dart';
import 'package:todo_cubit/logic/counter/counter_state.dart';
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    debugPrint("object");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
                builder: (context, state) {
               if(state is CounterLoading){
                return const CircularProgressIndicator();
               }

                return Text(
                  '${state.number}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );},
              listener: (context, state) {
                if (state is CounterError) {
                  showDialog(
                      context: context,
                      builder: (context) =>  AlertDialog(
                            content: Text(state.message),
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
            onPressed: BlocProvider.of<CounterCubit>(context).decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: BlocProvider.of<CounterCubit>(context).increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}