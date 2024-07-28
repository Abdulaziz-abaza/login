// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:lottie/lottie.dart';
// import 'package:task1/constant/constant.dart';
// import 'package:task1/generated/l10n.dart';
// import 'package:task1/login/registerview.dart';
// import 'package:task1/my_home_page.dart';
// // import 'package:flutter_svg/flutter_svg.dart';

// class LoginView extends StatefulWidget {
//   LoginView({super.key});
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }
// class _LoginViewState extends State<LoginView> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();

//   GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   bool _obscureText = true;

//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   void resetFields() {
//     setState(() {
//       email.clear();
//       password.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.only(top: 70),
//           child: Form(
//             key: formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(shape: BoxShape.circle),
//                   height: 300,
//                   width: 400,
//                   child: Lottie.asset('assets/reserv.json'),
//                 ),
//                 MyTextField(
//                   myvalidator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter Your Email';
//                     }
//                     return null;
//                   },
//                   mycontroller: email,
//                   myhintText: S.of(context).email,
//                   mylabel: S.of(context).email,
//                   obscureTextt: false,
//                   TextInputTypee: TextInputType.emailAddress,
//                   suffixIconn: const Icon(Icons.email),
//                 ),
//                 MyTextField(
//                   myvalidator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter Your Password';
//                     }
//                     return null;
//                   },
//                   mycontroller: password,
//                   TextInputTypee: TextInputType.text,
//                   obscureTextt: _obscureText,
//                   suffixIconn: IconButton(
//                     icon: Icon(
//                       _obscureText
//                           ? Icons.remove_red_eye
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: _togglePasswordVisibility,
//                   ),
//                   myhintText: S.of(context).password,
//                   mylabel: S.of(context).password,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                         child: mytextbtn(
//                             myTextt: S.of(context).forgotPassword,
//                             textColor: AppConstants.accentColor,
//                             fontSize: AppConstants.mediumFontSize,
//                             onPressedee: () async {}
//                             //   if (email.text == "") {
//                             //     ScaffoldMessenger.of(context).showSnackBar(
//                             //       const SnackBar(
//                             //         duration: Duration(milliseconds: 4000),
//                             //         content: Text('Please Enter Your Email'),
//                             //       ),
//                             //     );
//                             //     return;
//                             //   }
//                             //   await FirebaseAuth.instance
//                             //       .sendPasswordResetEmail(email: email.text);
//                             //   ScaffoldMessenger.of(context).showSnackBar(
//                             //     const SnackBar(
//                             //       duration: Duration(milliseconds: 4000),
//                             //       content: Text('Password Reset Email Sent'),
//                             //     ),
//                             //   );

//                             )),
//                   ],
//                 ),
//                 MyButton(
//                     btnText: S.of(context).login,
//                     onPressedee: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MyHomePage(),
//                         ),
//                       );
//                     }
//                     // async {
//                     //   if (formkey.currentState!.validate()) {
//                     //     try {
//                     //       final credential = await FirebaseAuth.instance
//                     //           .signInWithEmailAndPassword(
//                     //         email: email.text,
//                     //         password: password.text,
//                     //       );
//                     //       if (credential.user!.emailVerified) {
//                     //         Navigator.pushReplacementNamed(
//                     //             context, '/HomeScreen');
//                     //       } else {
//                     //         FirebaseAuth.instance.currentUser!
//                     //             .sendEmailVerification();
//                     //         ScaffoldMessenger.of(context).showSnackBar(
//                     //           const SnackBar(
//                     //             duration: Duration(milliseconds: 4000),
//                     //             content: Text('Email Verification Sent'),
//                     //           ),
//                     //         );
//                     //       }
//                     //     } on FirebaseAuthException catch (e) {
//                     //       if (e.code == 'user-not-found') {
//                     //         print('No user found for that email.');
//                     //         ScaffoldMessenger.of(context).showSnackBar(
//                     //           const SnackBar(
//                     //             duration: Duration(milliseconds: 4000),
//                     //             content:
//                     //                 Text('No user found for that email.........'),
//                     //           ),
//                     //         );
//                     //       } else if (e.code == 'wrong-password') {
//                     //         print('Wrong password provided for that user.');
//                     //         ScaffoldMessenger.of(context).showSnackBar(
//                     //           const SnackBar(
//                     //             duration: Duration(milliseconds: 4000),
//                     //             content: Text(
//                     //                 'Wrong password provided for that user.'),
//                     //           ),
//                     //         );
//                     //       }
//                     //     }
//                     //   } else {}
//                     //   // resetFields();
//                     // },
//                     ),
//                 myspace(),
//                 const Divider(),
//                 Text(S.of(context).loginWith,
//                     style: TextStyle(
//                       color: AppConstants.textColor,
//                       fontSize: AppConstants.largeFontSize,
//                     )),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.facebook,
//                           color: Colors.blue,
//                           size: 55,
//                         )),
//                     IconButton(
//                         onPressed: () {
//                           // signInWithGoogle(context);
//                         },
//                         icon: ClipRRect(
//                           borderRadius: BorderRadius.circular(110),
//                           child: Container(
//                             child: Image.asset(
//                               'assets/google.png',
//                               width: 55,
//                               height: 55,
//                             ),
//                           ),
//                         )),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(S.of(context).dontHaveAnAccount,
//                         style: TextStyle(
//                           color: AppConstants.textColor,
//                           fontSize: AppConstants.largeFontSize,
//                         )),
//                     mytextbtn(
//                         myTextt: S.of(context).register,
//                         onPressedee: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => RegisterPage()),
//                           );
//                         }),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:task1/constant/constant.dart';
import 'package:task1/generated/l10n.dart';
import 'package:task1/login/registerview.dart';
import 'package:task1/my_home_page.dart';
import 'package:task1/widget/user_provider.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 70),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: 300,
                  width: 400,
                  child: Lottie.asset('assets/reserv.json'),
                ),
                MyTextField(
                  myvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                    return null;
                  },
                  mycontroller: email,
                  myhintText: S.of(context).email,
                  mylabel: S.of(context).email,
                  obscureTextt: false,
                  TextInputTypee: TextInputType.emailAddress,
                  suffixIconn: const Icon(Icons.email),
                ),
                MyTextField(
                  myvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                    return null;
                  },
                  mycontroller: password,
                  TextInputTypee: TextInputType.text,
                  obscureTextt: _obscureText,
                  suffixIconn: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  myhintText: S.of(context).password,
                  mylabel: S.of(context).password,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: mytextbtn(
                        myTextt: S.of(context).forgotPassword,
                        textColor: AppConstants.accentColor,
                        fontSize: AppConstants.mediumFontSize,
                        onPressedee: () {},
                      ),
                    ),
                  ],
                ),
                MyButton(
                  btnText: S.of(context).login,
                  onPressedee: () async {
                    if (formkey.currentState!.validate()) {
                      final profileProvider =
                          Provider.of<ProfileProvider>(context, listen: false);
                      await profileProvider.loadProfile();
                      if (email.text == profileProvider.email &&
                              password.text == profileProvider.password ||
                          email.text == profileProvider.newemail &&
                              password.text == profileProvider.newpassword) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Invalid email or password!'),
                          ),
                        );
                      }
                    }
                  },
                ),
                myspace(),
                const Divider(),
                Text(S.of(context).loginWith,
                    style: TextStyle(
                      color: AppConstants.textColor,
                      fontSize: AppConstants.largeFontSize,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 55,
                        )),
                    IconButton(
                        onPressed: () {
                          // signInWithGoogle(context);
                        },
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(110),
                          child: Container(
                            child: Image.asset(
                              'assets/google.png',
                              width: 55,
                              height: 55,
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).dontHaveAnAccount,
                        style: TextStyle(
                          color: AppConstants.textColor,
                          fontSize: AppConstants.largeFontSize,
                        )),
                    mytextbtn(
                      myTextt: S.of(context).register,
                      onPressedee: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
