import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitledfood/Services/customDialog.dart';

class Auth_helper {
  Auth_helper._();

  static Auth_helper auth_helper = Auth_helper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;



// ////////////////////////////////////////Sign up user using FireStore///////////////////////////////////////////////////////////////
  Future<UserCredential> signup(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
    //  print(userCredential.user.uid);
      return userCredential;

//same the id but large digits and has a expire time and it is more secure
      print(userCredential.user.getIdToken());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomDialog.customDialog
            .showCustom('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomDialog.customDialog
            .showCustom('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////Sign in user using Authintication FireBase///////////////////////////
  Future<UserCredential> signin(String email,String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      vereifyEmail();

    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        CustomDialog.customDialog.showCustom('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialog.customDialog
            .showCustom('Wrong password provided for that user.');
      }
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////Reset Password using Email////////////////////////////////////////
  resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    CustomDialog.customDialog.showCustom(
        'We have sent email for reset password, please check your email');
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////Send Verfication message  using Email////////////////////////////////////////

  vereifyEmail() async {
    if (firebaseAuth.currentUser != null &&
        !firebaseAuth.currentUser.emailVerified) {
      await firebaseAuth.currentUser.sendEmailVerification();
    }
    CustomDialog.customDialog.showCustom('verification success.');
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ///////////Log out from firebase////////////
  signOut() async {
    await firebaseAuth.signOut();
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////Check if verfication message checked /////////////////
  bool checkEmailVerification() {
    return firebaseAuth.currentUser?.emailVerified ?? false;
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 ///////////////Get current user in firebase///////////////////
  Future<User> getCurrentUser() async {
    try {
      var currentuser = firebaseAuth.currentUser;
      if (currentuser != null){

        print(currentuser);
        return firebaseAuth.currentUser;}
    } on Exception catch (e) {
    print(e);
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////Get id for current user ///////////////////
  String getUserId(){
   try {
     return  firebaseAuth.currentUser.uid;
   } on Exception catch (e) {
   print(e);
   }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // Check if user found or not //////////////
  bool checkUser(){
    if(firebaseAuth.currentUser==null){
      return false;
    }
    else{
      return true;
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
