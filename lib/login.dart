import 'package:flutter/material.dart';
import 'package:todo/secretary.dart';
import 'package:todo/student.dart';
import 'package:todo/teacher.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String selectedRole = 'Öğrenci';

  // Sahte kullanıcı bilgileri
  final Map<String, Map<String, String>> fakeUsers = {
    'Öğrenci': {'username': 'ogrenci', 'password': '12345'},
    'Öğretmen': {'username': 'ogretmen', 'password': 'abcde'},
    'Sekreter': {'username': 'sekreter', 'password': '54321'},
  };

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    Map<String, String>? userCredentials = fakeUsers[selectedRole];

    if (userCredentials != null &&
        username == userCredentials['username'] &&
        password == userCredentials['password']) {
      // Doğru giriş bilgileri: ilgili sayfaya yönlendir
      if (selectedRole == 'Öğrenci') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Student()),
        );
      } else if (selectedRole == 'Öğretmen') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Teacher()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Secretary()),
        );
      }
    } else {
      // Yanlış giriş bilgileri: hata mesajı göster
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Hatalı Giriş'),
          content: const Text('Kullanıcı adı veya şifre hatalı.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tamam'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://i.pinimg.com/originals/f3/50/20/f35020ef2f2d3a9f1bb78d5a5be09f82.png',
                height: 300,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Kullanıcı Adı',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Şifre',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedRole,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue!;
                  });
                },
                items: <String>['Öğrenci', 'Öğretmen', 'Sekreter']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF48D5C6),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}