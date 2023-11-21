import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photoshot/components/feedcard.dart';
import 'package:photoshot/components/body_elements/navbar.dart';
import 'package:photoshot/components/body_elements/topbar.dart';
import 'package:photoshot/components/body_elements/customscaffold.dart';
import 'package:photoshot/screens/search.dart';

class HomePage extends StatelessWidget {
  // construtor
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // imagens de exemplo
    final List<String> listimages = [
      "https://plus.unsplash.com/premium_photo-1681996735353-df9e1e4085b9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTEzfHxwaG90b2dyYXBoeXxlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1554844453-7ea2a562a6c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww",
      "https://images.unsplash.com/photo-1589656966895-2f33e7653819?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1551737823-dfc8495904b4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww",
      "https://images.unsplash.com/photo-1574870111867-089730e5a72b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1607010063495-a18e40ec6ff3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzh8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww",
      "https://images.unsplash.com/photo-1474511320723-9a56873867b5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGFuaW1hbHN8ZW58MHx8MHx8fDA%3D",
      "https://images.unsplash.com/photo-1456926631375-92c8ce872def?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGFuaW1hbHN8ZW58MHx8MHx8fDA%3D",
      "https://images.unsplash.com/photo-1500521680613-a8f77c5cd0f5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTF8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww",
      "https://images.unsplash.com/photo-1481923387198-050ac1a2896e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTI4fHxwaG90b2dyYXBoeXxlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1496551729338-fa0c71a2c950?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQwfHxwaG90b2dyYXBoeXxlbnwwfHwwfHx8MA%3D%3D",
    ];
    // exemplos de users
    final Map<String, dynamic> user01 = {
      'name': 'João',
      'profilepic': listimages[5],
      'photo': listimages[8],
    };
    final Map<String, dynamic> user02 = {
      'name': 'Alberto',
      'profilepic': listimages[3],
      'photo': listimages[1],
    };
    final Map<String, dynamic> user03 = {
      'name': 'Maria',
      'profilepic': listimages[2],
      'photo': listimages[0],
    };
    // lista com todos os users
    final List<Map<String, dynamic>> users = [user01, user02, user03];

    // retorno de HomePage
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: CustomScaffold(
        // appBar: buildAppBar('home'),
        body: CustomScaffold(
          appBar: buildAppBar('home'),
          body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => Feedcard(userdata: users[index]),
          ),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
