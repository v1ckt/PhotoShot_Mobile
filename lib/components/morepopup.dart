import 'package:flutter/material.dart';
import 'package:photoshot/components/buttons.dart';

class MorePopUp extends StatelessWidget {
  const MorePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PopUpBtn(
                  icon: Image.asset(
                'assets/icons/download.png',
                width: 46,
                color: Colors.grey[800],
              )),
              PopUpBtn(
                  icon: Image.asset(
                'assets/icons/bookmark.png',
                width: 46,
                color: Colors.grey[800],
              )),
              PopUpBtn(
                  icon: Image.asset(
                'assets/icons/share.png',
                width: 46,
                color: Colors.grey[800],
              )),
            ],
          ),
          PopUpBtn(
              label: 'Salvar Predefinição',
              wide: true,
              icon: Image.asset(
                'assets/icons/adjust.png',
                width: 32,
                color: Colors.grey[800],
              )),
          PopUpBtn(
              label: 'Denunciar Publicação',
              labelcolor: const Color(0xBB901C14),
              wide: true,
              icon: Image.asset(
                'assets/icons/error.png',
                width: 32,
              )),
        ],
      ),
    );
  }
}
