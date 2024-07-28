// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task1/constant/constant.dart';
// import 'package:task1/generated/l10n.dart';
// import 'package:task1/login/loginview.dart';
// import 'package:task1/widget/user_provider.dart';
// import 'package:lottie/lottie.dart';

// // ignore: must_be_immutable
// class RegisterPage extends StatefulWidget {
//   RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   TextEditingController firstname = TextEditingController();
//   TextEditingController secondname = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController confpassword = TextEditingController();
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Container(
//           margin: EdgeInsets.only(top: 30),
//           child: Form(
//             key: formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(shape: BoxShape.circle),
//                   height: 300,
//                   child: Lottie.asset('assets/Register.json'),
//                 ),
//                 MyTextField(
//                   myvalidator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter Your First Name';
//                     }
//                   },
//                   mycontroller: firstname,
//                   myhintText: S.of(context).firstname,
//                   mylabel: S.of(context).firstname,
//                   obscureTextt: false,
//                   suffixIconn: Icon(Icons.person),
//                 ),
//                 MyTextField(
//                   myvalidator: (value) {
//                     if (value!.isEmpty) {
//                       return S.of(context).firstname;
//                     }
//                   },
//                   mycontroller: secondname,
//                   myhintText: S.of(context).lastname,
//                   mylabel: S.of(context).lastname,
//                   obscureTextt: false,
//                   suffixIconn: Icon(Icons.person),
//                 ),
//                 MyTextField(
//                   myvalidator: (value) {
//                     if (value!.isEmpty) {
//                       return S.of(context).lastname;
//                     }
//                   },
//                   mycontroller: email,
//                   myhintText: S.of(context).email,
//                   mylabel: S.of(context).email,
//                   obscureTextt: false,
//                   TextInputTypee: TextInputType.emailAddress,
//                   suffixIconn: Icon(Icons.email),
//                 ),
//                 MyTextField(
//                   myvalidator: (value) {
//                     if (value!.isEmpty) {
//                       return S.of(context).email;
//                     }
//                   },
//                   mycontroller: password,
//                   myhintText: S.of(context).password,
//                   mylabel: S.of(context).password,
//                   obscureTextt: true,
//                   suffixIconn: Icon(Icons.remove_red_eye),
//                 ),
//                 MyTextField(
//                   myvalidator: (value) {
//                     if (value!.isEmpty) {
//                       return S.of(context).password;
//                     }
//                   },
//                   mycontroller: confpassword,
//                   myhintText: S.of(context).confirmPassword,
//                   mylabel: S.of(context).confirmPassword,
//                   obscureTextt: true,
//                   suffixIconn: Icon(Icons.remove_red_eye),
//                 ),
//                 MyButton(
//                   btnText: S.of(context).register,
//                   onPressedee: () {
//                     if (formkey.currentState!.validate()) {
//                       final profileProvider =
//                           Provider.of<ProfileProvider>(context, listen: false);
//                       profileProvider.updateFirstName(firstname.text);
//                       profileProvider.updateSecondName(secondname.text);
//                       profileProvider.updateEmail(email.text);
//                       // تنفيذ تسجيل الدخول هنا
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginView()),
//                       );
//                     }
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(S.of(context).alreadyHaveAccount,
//                         style: TextStyle(
//                           color: AppConstants.textColor,
//                           fontSize: AppConstants.largeFontSize,
//                         )),
//                     mytextbtn(
//                         myTextt: S.of(context).login,
//                         onPressedee: () {
//                           // Navigator.pushNamed(context, '/LoginView');
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginView()),
//                           );
//                         })
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:task1/constant/constant.dart';
import 'package:task1/generated/l10n.dart';
import 'package:task1/login/loginview.dart';
import 'package:task1/widget/user_provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController secondname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confpassword = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  height: 300,
                  child: Lottie.asset('assets/Register.json'),
                ),
                MyTextField(
                  myvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your First Name';
                    }
                  },
                  mycontroller: firstname,
                  myhintText: S.of(context).firstname,
                  mylabel: S.of(context).firstname,
                  obscureTextt: false,
                  suffixIconn: Icon(Icons.person),
                ),
                MyTextField(
                  myvalidator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).firstname;
                    }
                  },
                  mycontroller: secondname,
                  myhintText: S.of(context).lastname,
                  mylabel: S.of(context).lastname,
                  obscureTextt: false,
                  suffixIconn: Icon(Icons.person),
                ),
                MyTextField(
                  myvalidator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).lastname;
                    }
                  },
                  mycontroller: email,
                  myhintText: S.of(context).email,
                  mylabel: S.of(context).email,
                  obscureTextt: false,
                  TextInputTypee: TextInputType.emailAddress,
                  suffixIconn: Icon(Icons.email),
                ),
                MyTextField(
                  myvalidator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).email;
                    }
                  },
                  mycontroller: password,
                  myhintText: S.of(context).password,
                  mylabel: S.of(context).password,
                  obscureTextt: true,
                  suffixIconn: Icon(Icons.remove_red_eye),
                ),
                MyTextField(
                  myvalidator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).password;
                    }
                  },
                  mycontroller: confpassword,
                  myhintText: S.of(context).confirmPassword,
                  mylabel: S.of(context).confirmPassword,
                  obscureTextt: true,
                  suffixIconn: Icon(Icons.remove_red_eye),
                ),
                MyButton(
                  btnText: S.of(context).register,
                  onPressedee: () async {
                    if (formkey.currentState!.validate()) {
                      if (password.text == confpassword.text) {
                        final profileProvider = Provider.of<ProfileProvider>(
                            context,
                            listen: false);
                        profileProvider.updateFirstName(firstname.text);
                        profileProvider.updateSecondName(secondname.text);
                        profileProvider.updateEmail(email.text);
                        profileProvider.updatePassword(password.text);
                        await profileProvider.saveProfile();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration successful!')),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Passwords do not match!')),
                        );
                      }
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).alreadyHaveAccount,
                        style: TextStyle(
                          color: AppConstants.textColor,
                          fontSize: AppConstants.largeFontSize,
                        )),
                    mytextbtn(
                      myTextt: S.of(context).login,
                      onPressedee: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
