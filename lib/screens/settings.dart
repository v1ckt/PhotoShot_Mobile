import 'package:flutter/material.dart';
import 'package:photoshot/components/body_elements/topbar.dart';
import 'package:photoshot/components/body_elements/customscaffold.dart';
import 'package:photoshot/components/settingsitem.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPage();
  }

class _SettingsPage extends State<SettingsPage> {
    List<dynamic> options = [
    SettingsItem(text: 'Notificações', icon: 'assets/icons/notifications.png'),
    SettingsItem(text: 'Segurança', icon: 'assets/icons/shield.png'),
    SettingsItem(text: 'Privacidade', icon: 'assets/icons/lock.png'),
    SettingsItem(text: 'Configurações da Conta', icon: 'assets/icons/accountsettings.png'),
    SettingsItem(text: 'Ajuda', icon: 'assets/icons/help.png'),
    SettingsItem(text: 'Sair', icon: 'assets/icons/logout.png', color: Color(0xFFDD4444)),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: buildAppBar(topBar: const TopBar(state: 'settings')),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView.separated(
          itemBuilder: (context, index) => options[index] as Widget,
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: options.length),
      ),
    );
}}