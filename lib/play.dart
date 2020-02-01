import 'dart:math';

import 'package:flutter/material.dart';

class Play extends StatefulWidget {
  Play({Key key}) : super(key: key);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  var _word = "Escolha uma Opção Abaixo";
  var _appImage = AssetImage("images/padrao.png");

  void _choiceUser(String choice){
    var escolha = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var appchoice = escolha[numero];

    switch(appchoice){  
      case"pedra":
      setState(() {
        this._appImage = AssetImage("images/pedra.png");
      });
      break;
      case"papel":
      setState(() {
        this._appImage = AssetImage("images/papel.png");
      });
      break;
      case"tesoura":
      setState(() {
        this._appImage = AssetImage("images/tesoura.png");
      });
      break;
    }
    if(
      (choice == "pedra" && appchoice == "papel") || (choice == "papel" && appchoice == "tesoura") || (choice == "tesoura" && appchoice == "pedra")
    ){
      setState(() {
        _word = "Xora tio, perdeste playboy";
      });
    }
    else if((choice == "pedra" && appchoice == "tesoura") || (choice == "papel" && appchoice == "pedra") || (choice == "tesoura" && appchoice == "papel")){
      setState(() {
        _word = "Ganhou Miserávi, agora vai estudar porra!";
      });
    }
    else _word = "Empatou ;(";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Jokenpo"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //text
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "Escolha do App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
              //image
              Image(
                image: this._appImage, 
                ),
              Padding(
                //result
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  _word,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w100,
                      color: Colors.indigoAccent),
                ),
              ),
              //images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=>_choiceUser("pedra"),
                    child: Image.asset("images/pedra.png", height: 100),),
                  GestureDetector(
                    onTap: ()=>_choiceUser("papel"),
                    child: Image.asset("images/papel.png", height: 100),),
                    GestureDetector(
                    onTap: ()=>_choiceUser("tesoura"),
                    child: Image.asset("images/tesoura.png", height: 100),)
                ],
              )
            ],
          ),
          )
        ));
  }
}
