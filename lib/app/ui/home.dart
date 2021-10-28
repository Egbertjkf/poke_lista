import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_lista/app/controller/nav_bar_controller.dart';
import 'package:poke_lista/app/ui/tabs/cadastro/cadastro.dart';
import 'package:poke_lista/app/ui/tabs/dashboard/dashboard.dart';
import 'package:poke_lista/app/ui/tabs/poke_list/poke_list.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageViewController = Get.find<BottomNavBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageViewController.pageViewController,
          onPageChanged: (value) {
            pageViewController.selectedPage = value;
          },
          children: [const DashBoard(), PokeList(), Cadastro()],
        ),
        bottomNavigationBar: AnimatedBuilder(
            animation: pageViewController,
            builder: (context, snapshot) {
              return Obx(
                () {
                  return BottomNavigationBar(
                    currentIndex: pageViewController.selectedPage,
                    onTap: (index) {
                      pageViewController.goTo(index);
                    },
                    backgroundColor: const Color(
                        0xFFD94A4A), //Color.fromRGBO(217, 74, 74, 1),
                    selectedItemColor: const Color(0xFFF2BE22),
                    unselectedItemColor: Colors.white,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home,
                          ),
                          label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.list,
                          ),
                          label: "PokeLista"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.add_circle,
                          ),
                          label: "Cadastro")
                    ],
                  );
                },
              );
            }));
  }
}
