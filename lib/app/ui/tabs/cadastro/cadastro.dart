import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poke_lista/app/controller/cadastro_controller.dart';
import 'package:poke_lista/app/controller/nav_bar_controller.dart';

// ignore: must_be_immutable
class Cadastro extends StatefulWidget {
  Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController pokeNameContoller = TextEditingController();

  final TextEditingController pokeDescContoller = TextEditingController();

  final CadastroContoller cadastroContoller = Get.find<CadastroContoller>();

  String? dropdownCategoriaValue;

  String? dropdownTipoValue;

  String? dropdownHabilidadeValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD94A4A),
        title: Center(
          child: Text('CADASTRE SEU POKEMON',
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                textStyle: const TextStyle(fontSize: 18),
              )),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Crie Seu próprio Pokémon',
                    style: GoogleFonts.robotoMono(
                      color: const Color(0xFF048ABF),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image == null) return;
                        final imageTemp = File(image.path);
                        cadastroContoller.setImagemPokemon(imageTemp);
                      },
                      child: Column(
                        children: [
                          GetBuilder<CadastroContoller>(
                            builder: (controller) {
                              return SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: cadastroContoller.imagemPokemon != null
                                      ? Image.file(
                                          cadastroContoller.imagemPokemon!)
                                      : Image.asset(
                                          'assets/pokeball.png',
                                        ));
                            },
                          ),
                          const Text("Editar")
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: 200,
                          child: TextFormField(
                            validator: (value) {
                              if (value == '' || value == null) {
                                return "Este campo é obrigatório";
                              }
                            },
                            controller: pokeNameContoller,
                            decoration: InputDecoration(
                              hintText: "Nome do Pokemon",
                              hintStyle: GoogleFonts.robotoMono(
                                color: Colors.black,
                              ),
                              label: const Text("Nome do Pokemon"),
                              labelStyle: GoogleFonts.robotoMono(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 1,
                        child: GetBuilder<CadastroContoller>(
                            builder: (controller) {
                          return DropdownButtonFormField(
                            validator: (value) {
                              if (value == '' || value == null) {
                                return "Este campo é obrigatório";
                              }
                            },
                            onChanged: (value) {
                              dropdownCategoriaValue = value.toString().trim();
                              controller.update();
                            },
                            value: dropdownCategoriaValue,
                            items: cadastroContoller.categoria
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            isExpanded: true,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            hint: Text(
                              'Categoria',
                              style: GoogleFonts.robotoMono(
                                color: Colors.black,
                              ),
                            ),
                          );
                        })),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child:
                          GetBuilder<CadastroContoller>(builder: (controller) {
                        return DropdownButtonFormField(
                          validator: (value) {
                            if (value == '' || value == null) {
                              return "Este campo é obrigatório";
                            }
                          },
                          value: dropdownTipoValue,
                          onChanged: (value) {
                            dropdownTipoValue = value.toString().trim();
                            controller.update();
                          },
                          items: cadastroContoller.tipo
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          isExpanded: true,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          hint: Text(
                            'Tipo',
                            style: GoogleFonts.robotoMono(
                              color: Colors.black,
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                GetBuilder<CadastroContoller>(
                  builder: (controller) {
                    return DropdownButtonFormField(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return "Este campo é obrigatório";
                        }
                      },
                      value: dropdownHabilidadeValue,
                      onChanged: (value) {
                        dropdownHabilidadeValue = value.toString().trim();
                        controller.update();
                      },
                      items: cadastroContoller.habilidade
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      hint: Text(
                        'Habilidade',
                        style: GoogleFonts.robotoMono(
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                    validator: (value) {
                      if (value == '' || value == null)
                        return "Este campo é obrigatório";
                    },
                    controller: pokeDescContoller,
                    decoration: InputDecoration(
                      hintText: "Descrição",
                      hintStyle: GoogleFonts.robotoMono(
                        color: Colors.black,
                      ),
                      label: const Text("Descrição"),
                      labelStyle: GoogleFonts.robotoMono(
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF048ABF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _formKey.currentState?.validate();
                        if (!(pokeNameContoller.text == '' ||
                            dropdownHabilidadeValue == null ||
                            dropdownTipoValue == null ||
                            dropdownCategoriaValue == null ||
                            pokeDescContoller.text == '')) {
                          cadastroContoller.cadastraPokemon(
                            pokeNameContoller.text,
                            dropdownHabilidadeValue,
                            dropdownTipoValue,
                            dropdownCategoriaValue,
                            pokeDescContoller.text,
                          );
                          Get.find<BottomNavBarController>().goTo(1);
                          _formKey.currentState?.reset();
                          dropdownHabilidadeValue = null;
                          dropdownTipoValue = null;
                          dropdownCategoriaValue = null;
                          cadastroContoller.update();
                        }
                      },
                      child: Text('Salvar',
                          style: GoogleFonts.robotoMono(
                            textStyle: const TextStyle(fontSize: 16),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
