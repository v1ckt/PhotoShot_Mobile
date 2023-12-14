import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photoshot/database/users/usuario.dart';

class UserController extends Usuario {
  late CollectionReference usuario;

  UserController():super(id: '', nome: '', username: '', profilepic: ''){
    usuario = FirebaseFirestore.instance.collection('Usuario');
  }

  insertUser(Usuario usuario) async {
    await this.usuario.doc(usuario.id).set({
      'id': usuario.id,
      'nome': usuario.nome,
      'username': usuario.username,
      'profilepic': usuario.profilepic,
    });
  }
  removeUser(Usuario usuario) async {
    await this.usuario.doc(usuario.id).delete();
  }
  updateUser(Usuario usuario) async {
    await this.usuario.doc(usuario.id).update({
      'id': usuario.id,
      'nome': usuario.nome,
      'username': usuario.username,
      'profilepic': usuario.profilepic,
    });
  }
  Future<Usuario> getUser(String id) async {
    DocumentSnapshot doc = await this.usuario.doc(id).get();
    return Usuario(
      id: doc['id'],
      nome: doc['nome'],
      username: doc['username'],
      profilepic: doc['profilepic'],
    );
  }
  Future<List<Usuario>> getAll() async {
    return await usuario.get().then((QuerySnapshot querySnapshot) {
      List<Usuario> list = [];
      querySnapshot.docs.forEach((doc) {
        list.add(Usuario(
          id: doc['id'],
          nome: doc['nome'],
          username: doc['username'],
          profilepic: doc['profilepic'],
        ));
      });
      return list;
    });
  }
}
