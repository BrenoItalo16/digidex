import 'package:flutter/material.dart';
import 'package:digidex/consts/consts_app.dart';
import 'package:digidex/pages/home_page/widgets/app_bar_home.dart';

class HomePage extends StatelessWidget {
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
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text('Digimon'),
                        )
                      ],
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
