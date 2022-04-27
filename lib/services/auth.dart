import 'package:messenger_doan/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //ĐẶT ĐIỀU KIỆN CHO USER LÀ TRUE HAY FALSE
  Use? _userFromFirebaseUser(User? user){
    return user != null ? Use(userId: user.uid) : null;
  }
  Future ?signInWithEmailAndPassword(String email , String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
    }
  }
  Future<FirebaseUser> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = new GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
    await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = await _auth.signInWithCredential(credential);
    FirebaseUser userDetails = result.user;

    if (result == null) {
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
    }
  }
  Future ?signUpWithEmailAndPassword(String email , String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
    }
  }
  Future ?resetPass(String email) async{
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }
  Future ?signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }
}





