// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task1/generated/l10n.dart';
// import 'package:task1/login/loginview.dart';
// import 'package:task1/widget/EditProfilePage.dart';
// import 'package:task1/widget/lang_set.dart';
// import 'package:task1/widget/locale_provider.dart';
// import 'package:task1/widget/theme_provider.dart';
// import 'package:task1/widget/theme_set.dart';
// import 'package:task1/widget/user_provider.dart';

// class AccountPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context).Profile),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               elevation: 4,
//               child: Container(
//                 width: double.infinity,
//                 height: 200,
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.brown[50],
//                 ),
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 63,
//                       backgroundImage:
//                           Provider.of<ProfileProvider>(context).image == null
//                               ? NetworkImage('https://via.placeholder.com/150')
//                               : FileImage(Provider.of<ProfileProvider>(context)
//                                   .image!) as ImageProvider,
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       Provider.of<ProfileProvider>(context).firstName,
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               elevation: 4,
//               child: ListTile(
//                 leading: Icon(Icons.person),
//                 title: Text(S.of(context).Profile),
//                 trailing: Icon(Icons.keyboard_arrow_right),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => EditProfilePage()),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 15),
//             Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               elevation: 4,
//               child: ListTile(
//                 leading: Icon(Icons.language),
//                 title: Text(S.of(context).language),
//                 trailing: Text(
//                     Provider.of<LocaleProvider>(context).locale.languageCode ==
//                             'en'
//                         ? 'English'
//                         : S.of(context).arabic),
//                 onTap: () {
//                   showLanguageSettingsDialog(context);
//                 },
//               ),
//             ),
//             SizedBox(height: 15),
//             Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               elevation: 4,
//               child: ListTile(
//                 leading: Icon(Icons.light_mode_outlined),
//                 title: Text(S.of(context).theme),
//                 trailing: Icon(Provider.of<ThemeProvider>(context).themeMode ==
//                         ThemeMode.dark
//                     ? Icons.dark_mode
//                     : Icons.light_mode),
//                 onTap: () {
//                   showThemeSettingsDialog(context);
//                 },
//               ),
//             ),
//             SizedBox(height: 15),
//             Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               elevation: 4,
//               child: ListTile(
//                 leading: Icon(Icons.logout),
//                 title: Text(S.of(context).logout),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LoginView(),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/login/loginview.dart';
import 'package:task1/widget/EditProfilePage.dart';
import 'package:task1/widget/lang_set.dart';
import 'package:task1/widget/locale_provider.dart';
import 'package:task1/widget/theme_provider.dart';
import 'package:task1/widget/theme_set.dart';
import 'package:task1/widget/user_provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.brown[50],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: Provider.of<ProfileProvider>(context)
                                    .image ==
                                null
                            ? NetworkImage('https://via.placeholder.com/150')
                            : FileImage(Provider.of<ProfileProvider>(context)
                                .image!) as ImageProvider,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Provider.of<ProfileProvider>(context).firstName,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            ' ${Provider.of<ProfileProvider>(context).secondName}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
            ),
            SizedBox(height: 13),
            Card(
              child: ListTile(
                leading: Icon(Icons.language),
                title: Text('Language'),
                trailing: Text(
                    Provider.of<LocaleProvider>(context).locale.languageCode ==
                            'en'
                        ? 'English'
                        : 'Arabic'),
                onTap: () {
                  showLanguageSettingsDialog(context);
                },
              ),
            ),
            SizedBox(height: 13),
            Card(
              child: ListTile(
                leading: Icon(Icons.light_mode_outlined),
                title: Text('theme'),
                trailing: Icon(Provider.of<ThemeProvider>(context).themeMode ==
                        ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode),
                onTap: () {
                  showThemeSettingsDialog(context);
                },
              ),
            ),
            SizedBox(height: 13),
            Card(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
