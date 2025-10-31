import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final String _correctPassword = "admin123";
  final FocusNode _passwordFocusNode = FocusNode();
  String _errorMessage = "";

  void _login() {
    _passwordFocusNode.unfocus();

    if (_passwordController.text == _correctPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      setState(() {
        _errorMessage = "Mật khẩu không đúng. Vui lòng thử lại!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Đăng nhập",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              TextField(
                 style: TextStyle(color: Colors.white),
                controller: _passwordController,
                obscureText: true,
                focusNode: _passwordFocusNode,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white60),
                  labelText: "Mật khẩu",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text("Đăng nhập"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
