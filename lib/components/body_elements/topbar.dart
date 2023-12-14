import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:photoshot/components/textfield.dart';
import 'package:photoshot/components/logo.dart';
import 'package:photoshot/components/scrollablefilter.dart';
import 'package:photoshot/components/profilepic.dart';
import 'package:photoshot/components/buttons.dart';
import 'package:photoshot/screens/settings.dart';

class TopBar extends StatefulWidget {
  final int? blurLevel;
  final String? state;
  final bool? isMy;
  const TopBar({Key? key, int? blurLevel, String? state, bool? isMy})
      : blurLevel = blurLevel ?? 30,
        state = state ?? 'home',
        isMy = isMy ?? false,
        super(key: key);

  @override
  Home createState() => Home();
}

class Home extends State<TopBar> {
  String? state = 'home';
  // bool isExpanded = false;
  List<String> filterList = [
    'Tudo',
    'Paisagem',
    'Retrato',
    'Animais',
    'Natureza',
    'Urbana',
    'Gestante',
  ];
  List<Widget> opFilterList = [
    Icon(Icons.grid_4x4_outlined, size: 20),
    Icon(Icons.info_outline, size: 20)
  ];

  @override
  Widget build(BuildContext context) {
    List<String> listimages = [
      "https://plus.unsplash.com/premium_photo-1681996735353-df9e1e4085b9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTEzfHxwaG90b2dyYXBoeXxlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1554844453-7ea2a562a6c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww",
      "https://images.unsplash.com/photo-1589656966895-2f33e7653819?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D",
    ];
    Map<String, dynamic> user02 = {
      'name': 'Alberto',
      'profilepic': listimages[3],
      'photo': listimages[1],
      'username': 'albertphoto',
    };

    double blur = widget.blurLevel!.toDouble();
    dynamic child;
    state = widget.state;
    myProfile() {
      return widget.isMy!
          ? [
              IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    )),
                icon: const Icon(Icons.settings_outlined),
              ),
              const SizedBox(width: 10)
            ]
          : [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const FollowBtn()
            ];
    }

    switch (state) {
      case 'home':
        child = const Logo(size: 26);
        break;
      case 'settings':
        child = Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            const SizedBox(width: 10),
            const Text('Configurações', style: TextStyle(fontSize: 26, color: Color(0xFF444444)))
          ],
        );
        break;
      case 'search':
        child = Container(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PrimaryInput(
                title: 'O que você está buscando?',
                pass: false,
                textsize: 16,
                width: double.infinity,
                icone: Icons.search,
                color: Color(0x22888888),
                fontcolor: Color(0xFF999999),
              ),
              ScrollableFilter(
                itemsCount: filterList.length,
                items: filterList,
              ),
            ],
          ),
          // ELEMENTO DE BAIXO
        );
        break;
      case 'profilecollapsed':
        child = Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        myProfile().first,
                        ProfilePic(
                          size: 36,
                          userdata: user02,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          user02['name'],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: myProfile().last,
                    )
                  ],
                ),
                ScrollableFilter(
                  itemsCount: filterList.length,
                  items: opFilterList,
                  isWide: true,
                ),
              ],
            ));
      case 'profile':
        child = Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // começo
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // primeiro elemento: voltar e seguir
                children: [
                  myProfile().first,
                  Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: myProfile().last,
                  )
                ],
              ),
              // segundo elemento: foto, nome, username e seguidores
              Column(
                children: [
                  ProfilePic(
                    size: 100,
                    userdata: user02,
                  ),
                  Text('@' + user02['username']),
                  Text(
                    user02['name'],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SEGUIDORES'),
                      SizedBox(
                        width: 20,
                      ),
                      Text('SEGUINDO')
                    ],
                  ),
                ],
              ),
              // ABAS
              ScrollableFilter(
                itemsCount: filterList.length,
                items: opFilterList,
                isWide: true,
              ),
            ],
          ),
        );
      default:
        child = const Text('Erro');
    }

    return Material(
      elevation: 10,
      color: Colors.transparent,
      shadowColor: const Color(0x55000000),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xBBFFFFFF),
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xFFAAAAAA),
                ),
              ),
            ),
            child: SafeArea(child: child),
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar({required TopBar topBar}) {
  return AppBar(
    toolbarHeight: topBar.state == 'search'
        ? 100
        : topBar.state == 'profile'
            ? 300
            : topBar.state == 'profilecollapsed'
                ? 100
                : 72,
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: const Color(0x00FFFFFF),
    elevation: 0,
    flexibleSpace: GestureDetector(
      child: topBar,
    ),
  );
}
