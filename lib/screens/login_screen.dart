import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //controladores
    TextEditingController txtConUser = TextEditingController();
    TextEditingController txtConPass = TextEditingController();

    const spaceHorizontal = SizedBox(height: 10,);
    
    //declaracion de los elementos
    /*final imgLogo = Container(
      width: 200,
        decoration: const BoxDecoration( 
          image: DecorationImage(
            image: AssetImage('logoesp.png')
         )
        ),
      );*/

    final imgLogo = Image.asset('logoesp.png', height: 200,);

    final txtUser = TextField(
      controller: txtConUser,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text('Correo')
      ),
    );

    final txtPass = TextField(
      controller: txtConPass,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text('Contraseña')
      ),
      obscureText: true,
    );

    final btnEntrar = FloatingActionButton.extended(
      icon: const Icon(Icons.login),
      label: const Text('Entrar'),
      onPressed: (){
      //onPressed: () => Navigator.pushNamed(context, '/dash');
        Navigator.pushNamed(context, '/dash');
      }
    );
    
    //construccion de la pantalla login
    /* return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration( 
          image: DecorationImage(
            opacity: .7,
            fit: BoxFit.cover,
            image: AssetImage('fondoesp.jpg')
         )
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                //color: Colors.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  //color: Colors.white
                ),
                child: Column(
                  children: [
                    txtUser,
                    const SizedBox(height: 10),
                    txtPass
                  ],
                ),
              ),
              imgLogo
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: btnEntrar,
    ); */

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: .4,
                fit: BoxFit.cover,
                image: AssetImage('fondoesp.jpg')
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      txtUser,
                      spaceHorizontal,
                      txtPass,
                      spaceHorizontal,
                      btnEntrar,
                      spaceHorizontal,
                    ],
                  ),
                  Positioned(
                    top: 100,
                    child: imgLogo,
                  )
                ],
              ),
            ),
          ),
          //isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }
}