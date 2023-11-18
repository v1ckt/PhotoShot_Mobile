import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photoshot/components/buttons.dart';

class MorePopUp extends StatelessWidget {
  const MorePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          // height: 300,
          padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
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
                  color: Colors.grey[400],
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
                  )),
                  PopUpBtn(
                      icon: Image.asset(
                    'assets/icons/bookmark.png',
                    width: 46,
                  )),
                  PopUpBtn(
                      icon: Image.asset(
                    'assets/icons/share.png',
                    width: 46,
                  )),
                ],
              ),
              PopUpBtn(
                  label: 'Salvar Predefinição',
                  wide: true,
                  icon: Image.asset(
                    'assets/icons/adjust.png',
                    width: 32,
                  )),
              PopUpBtn(
                  label: 'Denunciar Publicação',
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
