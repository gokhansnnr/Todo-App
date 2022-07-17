import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/cubit/anasayfa_cubit.dart';
import 'package:odev7/cubit/todo_detay_cubit.dart';
import 'package:odev7/cubit/todo_kayit_cubit.dart';
import 'package:odev7/views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => TodoKayitCubit()),
        BlocProvider(create: (context) => TodoDetayCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Anasayfa(),
      ),
    );
  }
}
