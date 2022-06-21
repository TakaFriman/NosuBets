import 'package:bets_app/components/already_have_an_account_check.dart';
import 'package:bets_app/components/rounded_button.dart';
import 'package:bets_app/models/screen_utils.dart';
import 'package:bets_app/screens/Login/components/background_login.dart';
import 'package:bets_app/screens/Login/components/text_field_container.dart';
import 'package:bets_app/screens/Signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  Body(this.submitFn, this.isLoading);
  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    BuildContext ctx,
  ) submitFn;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userName = TextEditingController();
  bool _obscure = true;
  final _formKey = GlobalKey<FormState>();
  final _userName = '';
  var _userEmail = '';
  var _userPassword = '';
  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        context,
      );
    }
  }

  void _changeObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;

    return BackgroundLogin(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size * 0.03),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size * 0.35,
          ),
          SizedBox(height: size * 0.03),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldContainer(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Введите Email адрес';
                      }
                      return null;
                    },
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      hintText: "Email",
                      icon: Icon(
                        Icons.person,
                        color: Utils.kPrimaryColor,
                      ),
                      border: InputBorder.none,
                    ),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Пароль должен содержать не менее 6 символов!';
                      }
                      return null;
                    },
                    obscureText: _obscure,
                    maxLines: 1,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Пароль",
                      icon: Icon(
                        Icons.lock,
                        color: Utils.kPrimaryColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: Utils.kPrimaryColor,
                        ),
                        onPressed: _changeObscure,
                      ),
                      border: InputBorder.none,
                    ),
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                  ),
                ),
                widget.isLoading
                    ? const CircularProgressIndicator()
                    : RoundedButton(
                        text: "Войти",
                        press: _trySubmit,
                      ),
                SizedBox(height: size * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
