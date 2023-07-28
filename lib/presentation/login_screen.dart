import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data/shared_pref.dart';
import '../utils/colors.dart';
import '../utils/navigation.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShowError = false;
  String errorMessage = "رقم الموبايل مطلوب";
  var phoneNumber = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        isShowError = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "تسجيل الدخول",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: AppColors.colorNeutral900),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            // Hide the keyboard and change the focus scope
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: AppColors.colorWhite900,
            margin: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "للدخول لحسابك ومتابعة اعلاناتك برجاء ادخال البيانات الاتية",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorBlue400,
                  ),
                ),
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "رقم الموبايل",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.colorBoldBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 65,
                  child: TextField(
                    focusNode: _focusNode,
                    controller: phoneNumber,
                    textDirection: TextDirection.rtl,
                    maxLength: 11,
                    cursorColor: AppColors.colorBlue500Base,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText:
                          "اكتب رقم الهاتف او الايميل اللي سجلت بيه قبل كده",
                      hintStyle: TextStyle(
                        color: AppColors.colorDarkBlue400,
                        fontSize: 11,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: AppColors.colorDarkBlue100), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: AppColors.colorDarkBlue100), //<-- SEE HERE
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: AppColors.colorBlue500Base,
                    ),
                  ),
                ),
                Visibility(
                  visible: isShowError,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "رقم الموبايل غير صحيح",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.colorError500Base,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (phoneNumber.text.toString().isEmpty) {
                        errorMessage = "رقم الموبايل مطلوب ";
                        isShowError = true;
                      } else if (phoneNumber.text.toString().length != 11 ||
                          phoneNumber.text.toString().substring(0, 2) != "01") {
                        errorMessage = "رقم الموبايل غير صحيح";
                        isShowError = true;
                      } else {
                        isShowError = false;
                        SharedPref.setBool( "is_logged_in", true);
                        navigatoTo(
                            context: context, screen: const HomePage());
                      }
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppColors.colorOrange500Base,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    child: const Text(
                      "تسجيل دخول",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorWhite900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Row(children: <Widget>[
                  Expanded(child: Divider()),
                  SizedBox(
                    width: 40,
                    child: Center(child: Text("أو")),
                  ),
                  Expanded(child: Divider()),
                ]),
                const SizedBox(height: 30),
                const Text(
                  "ممكن تسجل عن طريق",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorBlue700,
                  ),
                ),
                const SizedBox(height: 30),
                Row(children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                      //  FocusScope.of(context).unfocus();
                        setState(() {
                          _signInWithGoogle().whenComplete(
                            () => navigatoTo(
                                context: context, screen: const HomePage()),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: AppColors.colorOrange500Base,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      child: const Text(
                        "جوجل",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorWhite900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    // child: ButtonWithIcon(
                    //     onPressed: () {
                    //       FocusScope.of(context).unfocus();
                    //       setState(() {
                    //         _singInWithFacebook().whenComplete(() => navigatoTo(
                    //             context: context, screen: HomePage()));
                    //       });
                    //     },
                    //     icon: SvgPicture.asset("assets/ic_facebook_blue.xml"),
                    //     label: "فيسبوك"),
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        setState(() {
                        
                          _singInWithFacebook().whenComplete(() => navigatoTo(context: context, screen: const HomePage()));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: AppColors.colorOrange500Base,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      child: const Text(
                        "فيسبوك",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorWhite900,
                        ),
                      ),
                    )
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _singInWithFacebook() async {
    // Perform the Facebook login
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      // Successful Facebook login, now log in with Firebase
      final AccessToken accessToken = result.accessToken!;
      final AuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);

      // Log in to Firebase with the Facebook credential
      try {
        final UserCredential firebaseAuthResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Firebase user logged in successfully
        final User? user = firebaseAuthResult.user;
        if (user != null) {
          // ignore: avoid_print, use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Firebase user logged in: ${user.uid}'),
          ));
        }
      } catch (e) {
        // ignore: avoid_print, use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Firebase login error: $e'),
        ));
      }
    } else {
      // ignore: avoid_print, use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Facebook login failed. Reason: ${result.message}'),
      ));
      // Handle Facebook login failure
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Get Google Sign-In authentication details
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential with the Google access token
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential
        final UserCredential firebaseAuthResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Firebase user logged in successfully
        final User? user = firebaseAuthResult.user;
        if (user != null) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Firebase user logged in: ${user.uid}'),
          ));
        }
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Google Sign-In process canceled.'),
        ));
        // Handle Google Sign-In cancellation
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Google Sign-In error: $e'),
      ));
    }
  }
}
