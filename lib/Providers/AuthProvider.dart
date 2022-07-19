import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:untitledfood/Auth/Helper/auth_helper.dart';
import 'package:untitledfood/Auth/Helper/fireStore_Helper.dart';
import 'package:untitledfood/Auth/UI/LoginPage.dart';
import 'package:untitledfood/Auth/UI/MainAuth.dart';
import 'package:untitledfood/Auth/UI/NewPassword.dart';
import 'package:untitledfood/Auth/UI/OTPhone.dart';
import 'package:untitledfood/Models/RegisterRequest.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Services/customDialog.dart';
import 'package:untitledfood/UIScreens/HomePage.dart';
import 'package:untitledfood/UIScreens/Boarding/Slider_one.dart';

class AuthProvider extends ChangeNotifier {
  /////////////////////////////////////////////Verify By Phone//////////////////////////////

  TextEditingController pinPutController = TextEditingController();
  FocusNode pinPutFocusNode = FocusNode();

  BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(15.0),
  );

  sendPin(pin) async {
    Auth_helper.auth_helper.firebaseAuth
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: verificationCode, smsCode: pin))
        .then((value) async {
      if (value.user != null) {
        AppRouter.appRouter.gotoPagewithReplacment(NewPassword.routeName);
      }
    });
  }

  String verificationCode;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobileNoController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              AppRouter.appRouter.gotoPagewithReplacment(LoginPage.routeName);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          verificationCode = verficationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationCode = verificationID;
        },
        timeout: Duration(seconds: 120));
    notifyListeners();
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////

  //////Controller//////
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  clearController() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    //confirmController.clear();
    mobileNoController.clear();
    //addressController.clear();
  }

////////////////////////////////////

  File file;

  selectFile() async {
    XFile imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(imageFile.path);
    notifyListeners();
  }

/////Sign up//////////////////////////////

  register() async {
    try {
      UserCredential userCredential = await Auth_helper.auth_helper
          .signup(emailController.text, passwordController.text);
      RegisterRequest registerRequest = RegisterRequest(
          id: Auth_helper.auth_helper.getUserId(),
          password: passwordController.text,
          address: addressController.text,
          Confirmpassword: confirmController.text,
          name: nameController.text,
          email: emailController.text,
          mobileNo: mobileNoController.text);
      await fireStore_Helper.helper.addUserToFireBase(registerRequest);
      await Auth_helper.auth_helper.vereifyEmail();
      await Auth_helper.auth_helper.signOut();
      AppRouter.appRouter.gotoPagewithReplacment(LoginPage.routeName);
    } on Exception catch (e) {
      print(e);
    }

    // clearController();
    notifyListeners();
  }

////////////////////////////////////////////////

  //////Login////////////////////////////////////
  login() async {
    UserCredential userCredential = await Auth_helper.auth_helper
        .signin(emailController.text, passwordController.text);

    await fireStore_Helper.helper.getUserFromFirestore();
    bool isVerified = Auth_helper.auth_helper.checkEmailVerification();
    print(isVerified);
    if (isVerified) {
      AppRouter.appRouter.gotoPagewithReplacment(HomePage.routeName);
    } else {
      CustomDialog.customDialog.showCustom(
          'You have to verify your email,press ok to send another email',
          sendVerification);
    }

    // clearController();
    notifyListeners();
  }

//////////////////////////////////////////////////////

  //////Verification//////////////////////
  sendVerification() {
    Auth_helper.auth_helper.vereifyEmail();
    Auth_helper.auth_helper.signOut();
  }

//////////////////////////////////////////////////////

  //////////////////Reset Password////////////////////////
  resetPassword() async {
    Auth_helper.auth_helper.resetPassword(emailController.text);
    //clearController();
    AppRouter.appRouter.gotoPagewithReplacment(CodeMobile.routeName);
  }

/////////////

  //////GetCurrent User//////////////////////////////

  RegisterRequest user;

  getUserFromFirestore() async {
    user = await fireStore_Helper.helper.getUserFromFirestore();
    // print(user.toMap());
    notifyListeners();
  }

  ///////////////

  //////Get All Users////////

//////Get All Users////////
  List<RegisterRequest> users;
  String myId;

  getAllUsers() async {
    users = await fireStore_Helper.helper.getAllUsersFromFirestore();
    users.removeWhere((element) => element.id == myId);
    notifyListeners();
  }

/////////////////////

//////Check User Found///////
  checkLogin() {
    bool isLoggin = Auth_helper.auth_helper.checkUser();
    if (isLoggin) {
      this.myId = Auth_helper.auth_helper.getUserId();
      getUserFromFirestore();
      getAllUsers();
      AppRouter.appRouter.gotoPagewithReplacment(Slider_one.routeName);
    } else {
      AppRouter.appRouter.gotoPagewithReplacment(MainAuth.routeName);
    }
  }

  ///////////////////////
  fillControllers() {
    if (user != null) {
      emailController.text = user.email;
      nameController.text = user.name;
      mobileNoController.text = user.mobileNo;
      addressController.text = user.address;
      passwordController.text = user.password;
      confirmController.text = user.Confirmpassword;
    }
  }

  ////////////////////
  bool enable = false;

  setEnabled() {
    this.enable = true;
    notifyListeners();
  }

  updateProfile() async {
    this.enable = false;
    RegisterRequest userModel = RegisterRequest(
      email: emailController.text,
      address: addressController.text,
      name: nameController.text,
      mobileNo: mobileNoController.text,
      id: user.id,
      password: user.password,
      Confirmpassword: user.Confirmpassword,
    );
    if (passwordController.text == confirmController.text) {
      await fireStore_Helper.helper.updateProfile(userModel);
      getUserFromFirestore();
      Toast.show('Successfully Updated');
    } else {
      Toast.show('You should write correctly password ');
    }
    notifyListeners();
  }

  ///////////////Login With FaceBook/////////////

  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  FacebookLogin facebookLogin = FacebookLogin();
  bool isSignIn = false;

  Future<void> handleLogin() async {
    final FacebookLoginResult result = await facebookLogin.logIn(
      ['email'],
    );
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          await loginWithfacebook(result);
        } catch (e) {
          print(e);
        }
        break;
    }
  }

  Future loginWithfacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    isSignIn = true;
    _user = a.user;
    RegisterRequest registerRequest = RegisterRequest(
        id: Auth_helper.auth_helper.getUserId(),
        password: passwordController.text,
        address: addressController.text,
        Confirmpassword: confirmController.text,
        name: a.user.displayName,
        email: a.user.email,
        mobileNo: a.user.phoneNumber);
    await fireStore_Helper.helper.addUserToFireBase(registerRequest);
    await getUserFromFirestore();

    notifyListeners();
  }

  Future<void> FacebokSignout() async {
    await _auth.signOut().then((onValue) {
      facebookLogin.logOut();
      isSignIn = false;
    });
    notifyListeners();
  }

///////////////////////////////////////////////

////////////////////////////////////////Google Sign In///////////////////////////////////////////////
  bool google = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await _auth.signInWithCredential(authCredential);
      User user = result.user;
      if (result != null) {
        RegisterRequest registerRequest = RegisterRequest(
          id: Auth_helper.auth_helper.getUserId(),
          password: passwordController.text,
          address: addressController.text,
          Confirmpassword: confirmController.text,
          name: user.displayName,
          email: user.email,
          mobileNo: user.phoneNumber,
        );
        await fireStore_Helper.helper.addUserToFireBase(registerRequest);
        await getUserFromFirestore();
        AppRouter.appRouter.gotoPagewithReplacment(HomePage.routeName);
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  Future<void> GooglesignOut() async {
    await _googleSignIn.signOut();
    print('sign out');
  }

//////////////////////////////////////////////////////////////////////////////////////////////

//////////////////Sign out////////////////////////////////////
  logOut() async {
    await Auth_helper.auth_helper.signOut();
    AppRouter.appRouter.gotoPagewithReplacment(MainAuth.routeName);
  }
/////////////////////
}
