import 'package:flutter/material.dart';
import 'package:photoshot/components/body_elements/topbar.dart';
import 'package:photoshot/components/body_elements/customscaffold.dart';
import 'package:photoshot/components/feedcard.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key});

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

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'name': 'Chiara',
        'profilepic': listimages[5],
        'photo': listimages[6],
      },
      {
        'name': 'Alberto',
        'profilepic': listimages[3],
        'photo': listimages[1],
      },
      {
        'name': 'Pedro',
        'profilepic': listimages[2],
        'photo': listimages[0],
      },
      {
        'name': 'Maria',
        'profilepic': listimages[10],
        'photo': listimages[4],
      },
      {
        'name': 'Karol',
        'profilepic': listimages[7],
        'photo': listimages[8],
      },
      {
        'name': 'Caio',
        'profilepic': listimages[10],
        'photo': listimages[9],
      }
    ];

    return CustomScaffold(
      appBar: buildAppBar(topBar: const TopBar(state: 'home')),
      body: ListView.separated(
              itemBuilder: (context, index) => Feedcard(userdata: list[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: list.length),
    );
  }
}
