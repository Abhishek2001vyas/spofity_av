import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';


class Fir{
  final _auth= FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle() async{
    try{
      final GoogleSignInAccount? googleSignInAccount=
          await _googleSignIn.signIn();
      if (googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
        final AuthCredential authCredential=GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch(e){
      print(e.message);
      throw e;

    }


  }

  sigOut()async{
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

}
