import 'package:flutter/material.dart';
import 'package:photoshot/components/buttons.dart';
import 'package:photoshot/components/textfield.dart';
import 'package:photoshot/components/comment.dart';
import 'package:photoshot/components/sliderbox.dart';
import 'package:photoshot/components/morepopup.dart';
import 'package:photoshot/components/scrollablefilter.dart';

class Feedcard extends StatefulWidget {
  final Map<String, dynamic> userdata;
  String? state;
  Feedcard({
    Key? key,
    required this.userdata,
    this.state,
  }) : super(key: key);

  @override
  State<Feedcard> createState() => _FeedcardState();
}

class _FeedcardState extends State<Feedcard> {
  late Widget _child;
  List<String>? itemsList = [
    'Iluminação',
    'Cores',
    'Efeitos',
    'Detalhes',
  ];

  @override
  void initState() {
    super.initState();
    _setChild();
  }

  @override
  void didUpdateWidget(covariant Feedcard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state != widget.state) {
      _setChild();
    }
  }

  void _setChild() {
    switch (widget.state) {
      case 'comment':
        _child = Container(
          padding: const EdgeInsets.only(bottom: 15),
          // height: 500,
          child: Column(
            children: [
              const Text('Comentários', style: TextStyle(fontSize: 18)),
              // comentários
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 400,
                child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    children: [
                      Comment(
                          comment: 'Caraca, que massa!', username: 'alberto'),
                      Comment(comment: 'Que fofinho!', username: 'figurante'),
                      Comment(
                          comment: 'Eu sinceramente esperava mais.',
                          username: 'john'),
                      Comment(comment: 'Parabéns. Nota dó.', username: 'maria'),
                      Comment(comment: 'Um animal desse!', username: 'cleber'),
                      Comment(
                          comment: 'Caraca, que massa!', username: 'alberto'),
                      Comment(comment: 'Que fofinho!', username: 'figurante'),
                      Comment(
                          comment: 'Eu sinceramente esperava mais.',
                          username: 'john'),
                      Comment(comment: 'Parabéns. Nota dó.', username: 'maria'),
                      Comment(comment: 'Um animal desse!', username: 'cleber'),
                    ]),
              ),
              // input
              Container(
                alignment: Alignment.center,
                transformAlignment: Alignment.center,
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 20,
                      offset: Offset(0, -10),
                      spreadRadius: -5,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.camera_alt_outlined),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: const PrimaryInput(
                          title: 'Adicione um comentário',
                          pass: false,
                          height: 40,
                          textsize: 16,
                          icone: Icons.emoji_emotions_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        break;
      case 'adjust':
        _child = Container(
          padding: const EdgeInsets.only(bottom: 17, left: 10, right: 10),
          // height: 500,
          child: Column(
            children: [
              const Text('Ajustes da Foto', style: TextStyle(fontSize: 18)),
              ScrollableFilter(items: itemsList, itemsCount: itemsList!.length),
              // input
              Container(
                padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SliderBox(stage: 17, title: 'Exposição'),
                    SizedBox(height: 15),
                    SliderBox(stage: -2, title: 'Contraste'),
                    SizedBox(height: 15),
                    SliderBox(stage: -25, title: 'Realces'),
                    SizedBox(height: 15),
                    SliderBox(stage: 30, title: 'Sombras'),
                    SizedBox(height: 15),
                    SliderBox(stage: -16, title: 'Brancos'),
                    SizedBox(height: 15),
                    SliderBox(stage: 0, title: 'Pretos'),
                  ],
                ),
              ),
            ],
          ),
        );
        break;
      default:
        _child = Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Container(
            margin:
                const EdgeInsets.only(top: 20, right: 10, bottom: 14, left: 10),
            padding: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x11222222),
                  blurRadius: 15,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 226, 226, 226),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // Card
              children: [
                Column(children: [
                  // nome
                  Text(
                    widget.userdata['name'],
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ]),
                const SizedBox(height: 5),
                //Foto
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Image.network(
                    widget.userdata['photo'],
                    fit: BoxFit.fitWidth,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(
                                  padding: const EdgeInsets.all(160),
                                  child: const CircularProgressIndicator(
                                    color: Color(0xFF5200FF),
                                  ),
                                ),
                              ),
                  ),
                ),
                const SizedBox(height: 10),
                // Botões
                Container(
                    padding: const EdgeInsets.only(
                        top: 0, left: 10, right: 10, bottom: 10),
                    child: Row(
                      // botões da esquerda e da direita
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // botões da esquerda
                        Container(
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Likebtn(),
                              SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                      color: Colors.grey[400], width: 1)),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (widget.state == 'comment') {
                                      widget.state = 'default';
                                    } else {
                                      widget.state = 'comment';
                                    }
                                  });
                                  _setChild();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    'assets/icons/comment.png',
                                    width: 26,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                      color: Colors.grey[400], width: 1)),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (widget.state == 'adjust') {
                                      widget.state = 'default';
                                    } else {
                                      widget.state = 'adjust';
                                    }
                                  });
                                  _setChild();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    'assets/icons/adjust.png',
                                    width: 26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // botão da direita
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.black.withOpacity(0.3),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const FractionallySizedBox(
                                      heightFactor: 0.65,
                                      child: MorePopUp(),
                                    );
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Transform.rotate(
                                    angle: 3.14 / 2,
                                    child: Image.asset('assets/icons/more.png',
                                        width: 26)),
                              )),
                        ),
                      ],
                      // Botões inferiores
                    )),
                _child,
              ],
            ),
          ),
        ),
        Positioned(
          // Foto de perfil
          top: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF00E5), Color(0xFF0400D7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(widget.userdata['profilepic']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
