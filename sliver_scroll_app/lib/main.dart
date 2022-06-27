import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sliver_scroll_app/cubit/scroll_cubit.dart';
import 'package:sliver_scroll_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ScrollCubit(),
        child: Provider(
            create: (context) => Final(),
            child: const MaterialApp(
                debugShowCheckedModeBanner: false, home: Home())));
  }
}

class Final {
  bool get app => true;
}
