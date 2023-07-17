import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:conductor/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import "firebase_options.dart";

import 'blocs/blocs.dart';


Future main() async{ 

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) => GpsBloc()),
        BlocProvider(create: (context) => LocationBloc()),
        
      ], child:const MapsApp()
    )
  );
}

class MapsApp extends StatelessWidget {
  
  const MapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maps App',
      home: StartScreen()
      //LoadingScreen()
    );
  }
}