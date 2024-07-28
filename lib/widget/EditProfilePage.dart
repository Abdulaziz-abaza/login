import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:task1/generated/l10n.dart';
import 'package:task1/widget/user_provider.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _newemailController = TextEditingController();

  File? _image;

  @override
  void initState() {
    super.initState();
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    _firstNameController.text = profileProvider.firstName;
    _secondNameController.text = profileProvider.secondName;
    _emailController.text = profileProvider.email;
    _passwordController.text = profileProvider.password;
    _image = profileProvider.image;
    _newpasswordController.text = profileProvider.password;
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          Provider.of<ProfileProvider>(context, listen: false)
              .updateImage(_image);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'already_active') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Image picker is already active. Please wait.')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred: ${e.message}')));
      }
    }
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final profileProvider =
          Provider.of<ProfileProvider>(context, listen: false);
      profileProvider.updateFirstName(_firstNameController.text);
      profileProvider.updateSecondName(_secondNameController.text);
      profileProvider.updateEmail(_emailController.text);
      profileProvider.updatePassword(_passwordController.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Changes saved!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).EditProfile),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: _image == null
                          ? NetworkImage('https://via.placeholder.com/150')
                          : FileImage(_image!) as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: _pickImage,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: S.of(context).firstName,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).PleaseEnterYourFirstName;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _secondNameController,
                decoration: InputDecoration(
                  labelText: S.of(context).secondName,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).PleaseEnterYourSecondName;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _newemailController,
                decoration: InputDecoration(
                  labelText: S.of(context).email,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).PleaseEnterYourEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _newpasswordController,
                decoration: InputDecoration(
                  labelText: S.of(context).password,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).PleaseEnterYournewPassword;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveChanges();
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).saveChanges),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
