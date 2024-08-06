import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/bloc/counter_bloc.dart';
import 'package:todo_cubit/logic/counter/counter_cubit.dart';
import 'package:todo_cubit/presentation/counter_bloc_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()),
        ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: CounterBlocScreen()
          //MyHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}
