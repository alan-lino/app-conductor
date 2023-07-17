import 'package:conductor/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}


class _StartScreenState extends State<StartScreen> {
 
 /*late TextEditingController sturuta;

  @override
  void initState(){
    super.initState();
    sturuta = TextEditingController();
  } 


  @override
  void dispose(){
    super.dispose(); 
    sturuta.dispose();

  }*/




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Ruta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(

          children: <Widget>[
            /*TextFormField(
              controller: sturuta,
              decoration: const InputDecoration(
                hintText: "Ruta",
              ),
            ),*/
            MaterialButton(
              color: Colors.blue,
              shape: const StadiumBorder(),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return  const LoadingScreen(
                        //userId: const Uuid().v1(),
                        //ruta : sturuta.text,
                      );
                    })
                  );
                },
              child: const Text('Iniciar',style: TextStyle(color: Colors.white)))
    ],),
      ),
    );
  }
}




