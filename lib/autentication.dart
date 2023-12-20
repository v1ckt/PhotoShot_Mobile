import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<String?> signIn(String email, String password) async {
  try {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User? user = userCredential.user;
    return user!.uid;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('Não existe nenhuma conta cadastrada neste email.');
      return null;
    } else if (e.code == 'wrong-password') {
      print('Senha incorreta.');
      return null;
    }
  }
}

Future<String?> signUp(String email, String password) async {
  try {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(userCredential);
    final User? user = userCredential.user;
    return user!.uid;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      print('Já existe uma conta cadastrada neste email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> signOut() async {
  await _auth.signOut();
}

Future<User?> getCurrentUser() async {
  final User? user = _auth.currentUser;
  return user;
}

Future<void> sendEmailVerification() async {
  final User? user = _auth.currentUser;
  user!.sendEmailVerification();
}

Future<bool> isEmailVerified() async {
  final User? user = _auth.currentUser;
  return user!.emailVerified;
}

Future<void> resetPassword(String email) async {
  await _auth.sendPasswordResetEmail(email: email);
}

Future<void> changePassword(String password) async {
  final User? user = _auth.currentUser;
  user!.updatePassword(password);
}

Future<void> changeEmail(String email) async {
  final User? user = _auth.currentUser;
  user!.updateEmail(email);
}

Future<void> deleteUser() async {
  final User? user = _auth.currentUser;
  user!.delete();
}
