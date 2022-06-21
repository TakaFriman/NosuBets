import 'package:bets_app/components/already_have_an_account_check.dart';
import 'package:bets_app/components/rounded_button.dart';
import 'package:bets_app/models/screen_utils.dart';
import 'package:bets_app/models/user.dart';
import 'package:bets_app/screens/BettingLine/line_page.dart';
import 'package:bets_app/screens/Login/components/text_field_container.dart';
import 'package:bets_app/screens/Login/login_page.dart';
import 'package:bets_app/screens/Signup/components/background_sign.dart';
import 'package:bets_app/screens/Signup/components/or_divider.dart';
import 'package:bets_app/screens/Signup/components/social_icons.dart';
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
  final TextEditingController userNameController = TextEditingController();
  final List<User> _userData = [];
  final _formKey = GlobalKey<FormState>();
  var _userName = '';
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
      _userData.add(User(userName: _userName, email: _userEmail));
    }
  }

  void _changeObscure() {
    setState(() {
      obscure = !obscure;
    });
  }

  Icon icon = Icon(Icons.visibility);
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: BackgroundSign(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size * 0.35,
            ),
            SizedBox(height: size * 0.03),
            TextFieldContainer(
              child: TextFormField(
                controller: userNameController,
                autocorrect: true,
                textCapitalization: TextCapitalization.words,
                enableSuggestions: false,
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Имя пользователя слишком короткое!';
                  }
                  return null;
                },
                maxLines: 1,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "Имя пользователя",
                  icon: Icon(
                    Icons.person,
                    color: Utils.kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
                onSaved: (value) {
                  _userName = value!;
                },
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                controller: emailController,
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
                obscureText: obscure,
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
                    onPressed: () => _changeObscure(),
                  ),
                  border: InputBorder.none,
                ),
                onSaved: (value) {
                  _userPassword = value!;
                },
              ),
            ),
            if (widget.isLoading) CircularProgressIndicator(),
            if (!widget.isLoading)
              RoundedButton(
                text: "Зарегистрироваться",
                press: _trySubmit,
              ),
            SizedBox(height: size * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcons(
                  iconSrc: "assets/icons/vk.svg",
                  press: () {},
                ),
                SocialIcons(
                  iconSrc: "assets/icons/tg.svg",
                  press: () {},
                ),
                SocialIcons(
                  iconSrc: "assets/icons/google.svg",
                  press: () {},
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
