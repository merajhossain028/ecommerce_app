import 'package:ecommerce_app/common/custom_textfield.dart';
import 'package:ecommerce_app/common/widgets/custom_button.dart';
import 'package:ecommerce_app/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  singin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth_screen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _namecontroller,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailcontroller,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordcontroller,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(text: 'Sign Up', onTap: () {}),
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.singin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                    value: Auth.singin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.singin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailcontroller,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordcontroller,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(text: 'Sign In', onTap: () {}),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
