import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masakan_ala_anak_kos/helper/dimension_helper.dart';
import 'package:masakan_ala_anak_kos/notifiers/login_notifier.dart';
import 'package:masakan_ala_anak_kos/pages/main_page.dart';
import 'package:masakan_ala_anak_kos/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static final String route = '/login';

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  String _errorMessage = '';
  bool _isLoginEnabled = false;
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    if (context.read<LoginNotifier>().user != null) goToMainPage();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void validateInput() {
    if (_usernameTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      setState(() => _isLoginEnabled = true);
    }
  }

  void tryLogin() {
    if (_passwordTextController.text == 'Salah') {
      final snackBar = SnackBar(
        content: Text('Welcome ${_usernameTextController.text}!'),
      );
      context.read<LoginNotifier>().login(_usernameTextController.text);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      goToMainPage();
    } else {
      setState(() => _errorMessage = 'Passwordmu Salah');
    }
  }

  void goToMainPage() {
    Navigator.popAndPushNamed(context, MainPage.route);
  }

  @override
  Widget build(BuildContext context) {
    _usernameTextController.addListener(() {
      validateInput();
    });
    _passwordTextController.addListener(() {
      validateInput();
    });

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Masakan Ala Anak Kos'),
        body: Center(
          child: Container(
            // harus set width supaya TextField tidak kosong ketika lebar berubah
            width: DimensionHelper.isWeb(context)
                ? 750
                : DimensionHelper.getWidth(context),
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    width: 300.0,
                    height: 300.0,
                    child: Image.asset(
                      'images/logo.png', // source http://pngimg.com/uploads/chef/chef_PNG130.png
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _usernameTextController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                  ],
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                  textInputAction: TextInputAction.next,
                  focusNode: _usernameFocusNode,
                  onSubmitted: (_) =>
                      Focus.of(context).requestFocus(_passwordFocusNode),
                  maxLines: 1,
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _passwordTextController,
                  obscureText: _isHidden,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                  ],
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.security),
                    suffixIcon: IconButton(
                      icon: FaIcon(
                        _isHidden
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                      ),
                      onPressed: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  focusNode: _passwordFocusNode,
                  onSubmitted: (value) {
                    if (_passwordTextController.text.isNotEmpty &&
                        _passwordTextController.text.isNotEmpty) {
                      tryLogin();
                    }
                  },
                  maxLines: 1,
                ),
                SizedBox(height: 8.0),
                SelectableText(
                  _errorMessage,
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  onPressed: _isLoginEnabled ? () => tryLogin() : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
