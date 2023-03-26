import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_store/shared/cubit/app_cubit.dart';
import 'package:movies_store/shared/styles/styles.dart';

import 'bloc_observer.dart';
import 'modules/Start_Screen/Start_Screen.dart';
import 'modules/homeScreen/homeScreen.dart';
import 'modules/loginScreen/loginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()
          ..get_categories()
          ..get_Movies(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: darkTheme,
          home: const SafeArea(top: true, child: HomeScreen()),
        ));
  }
}
