import 'package:digidex/models/pokeapi.dart';
import 'package:flutter/material.dart';
import 'package:digidex/consts/consts_app.dart';
import 'package:digidex/pages/home_page/widgets/app_bar_home.dart';
import 'package:digidex/stores/pokeapi_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore pokeApiStore;
  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: [
          Positioned(
            top: -(240 / 4.7), //tamanho dividido por 4.7
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              child: Image.asset(
                ConstsApp.blackDigicode,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Container(
//            color: Colors.red,
            child: Column(
              children: [
                Container(
                  height: statusWidth,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      builder: (BuildContext context) {
                        PokeAPI _pokeApi = pokeApiStore.pokeAPI;
                        return (_pokeApi != null)
                            ? ListView.builder(
                                itemCount: _pokeApi.pokemon.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(_pokeApi.pokemon[index].name),
                                  );
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
