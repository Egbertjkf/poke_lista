import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_lista/app/controller/nav_bar_controller.dart';
import 'package:poke_lista/app/ui/tabs/dashboard/widgets/dashboard_button.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD94A4A),
        title: Center(
          child: Text('POKEDEX',
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                textStyle: const TextStyle(fontSize: 18),
              )),
        ),
      ),
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 1,
                child: SvgPicture.asset(
                  'assets/background.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/pokemon_logo.svg'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.find<BottomNavBarController>().goTo(1);
                        },
                        child: const DashBoardButton(
                          texto1: 'Veja Pokemons da Primeira Geração.',
                          texto2: 'Visualizar Pokemons.',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.find<BottomNavBarController>().goTo(2);
                        },
                        child: const DashBoardButton(
                          texto1: 'Crie já seu próprio pokemon',
                          texto2: "Cadastrar Novo Pokemon",
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 5),
                    child: Text(
                        'As circunstâncias do nascimento de alguém são irrelevantes; é o que você faz com o dom da vida que determina quem você é.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.robotoMono(
                          color: const Color(0xFF048ABF),
                          textStyle: const TextStyle(fontSize: 18),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 30),
                    child: Text('-MewTwo',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.robotoMono(
                          color: const Color(0xFF048ABF),
                          textStyle: const TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
