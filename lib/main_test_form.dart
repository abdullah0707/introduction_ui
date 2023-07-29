import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        home: const MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum AuthMode { SingUp, Login }

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  // final _isLoading = false;
  final _passwordController = TextEditingController();

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() => _authMode = AuthMode.SingUp);
    } else {
      setState(() => _authMode = AuthMode.Login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_authMode == AuthMode.Login)
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(fontSize: 20),
                    ),
                  if (_authMode == AuthMode.SingUp)
                    const Text(
                      'Please Sign Up!',
                      style: TextStyle(fontSize: 20),
                    ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                    onSaved: (value) => _authData['email'] = value!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length <= 5) {
                        return 'Password is too short!';
                      }
                      return null;
                    },
                    onSaved: (value) => _authData['password'] = value!,
                  ),
                  if (_authMode == AuthMode.SingUp)
                    TextFormField(
                      enabled: _authMode == AuthMode.SingUp,
                      decoration:
                          const InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: _authMode == AuthMode.SingUp
                          ? (value) => value != _passwordController.text
                              ? 'Password do not match!'
                              : null
                          : null,
                    ),
                  const SizedBox(height: 20),
                  FilledButton.tonal(
                    onPressed: _switcForm,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber),
                    ),
                    child: Text(
                      _authMode == AuthMode.Login ? 'Log In' : 'Sing Up',
                    ),
                  ),
                  TextButton(
                    onPressed: _switchAuthMode,
                    child: Text(
                      '${_authMode == AuthMode.Login ? 'Sing Up' : 'Log In'} INSTEAD',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber,
      title: const Text(
        'Flutter Home Page',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }

  void _switcForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (_authMode == AuthMode.Login) {
      // setState(() => _authMode = AuthMode.SingUp);
    } else {
      // setState(() => _authMode = AuthMode.Login);
    }
    _formKey.currentState!.save();
  }
}
