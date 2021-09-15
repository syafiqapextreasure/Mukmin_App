import 'package:app01/layout/mukmin_app/cubit/states.dart';
import 'package:app01/shared/bloc_observer.dart';
import 'package:app01/shared/styles/themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/mukmin_app/cubit/cubit.dart';
import 'layout/mukmin_app/mukmin_layout.dart';

main() async {
  Bloc.observer = MyBlocObserver();
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
    ));
  }

  initState();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => MukminCubit()),
      ],
      child: BlocConsumer<MukminCubit, MukminStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.dark,
              home: MukminLayout(),
            );
          },
          listener: (context, state) {}),
    );
  }
}
