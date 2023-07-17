import 'package:flutter/material.dart';
import 'package:conductor/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import '../services/firebase_services.dart';
import '../views/views.dart';


class MapScreen extends StatefulWidget {
   
   const MapScreen({Key? key,}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  late LocationBloc locationBloc;
  
  @override
  void initState(){
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    //locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
    

  } 


  @override
  void dispose(){
    locationBloc.stopFollowinUser();
    super.dispose(); 

  }

 
  


   @override
   Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('STU App', textAlign: TextAlign.center),
        
      ),
      body: BlocBuilder<LocationBloc,LocationState>(
        builder: (context,state){

          if (state.lastKnowPosition == null) return const Center(child: Text('Espere por favor...'));
          
          return 

             MapView(initialLocation: state.lastKnowPosition!);
          
            
          
         }
        )
      );
   }
}