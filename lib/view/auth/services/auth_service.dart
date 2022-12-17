import 'package:ecommerce_app/constants/error_handling.dart';
import 'package:ecommerce_app/constants/utils.dart';
import 'package:flutter/material.dart';

import '../../../global_variables.dart';
import '../../../models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        id: '',
        v: 0,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          res: res,
          context: context,
          onSucess: () {
            showSnackBar(
                context, 'Account Created! Login with the same credentials');
          });
      // print(res.statusCode);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
