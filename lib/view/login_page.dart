import 'package:flutter/material.dart';
import 'package:moneytracker/provider/auth_provider.dart';
import 'package:moneytracker/utils/Utility.dart';
import 'package:moneytracker/utils/colors_utility.dart';
import 'package:moneytracker/view/home_screen.dart';
import 'package:moneytracker/view/sign_up_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _isLoadingEmail = false;
  bool _isLoadingGoogle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsUtility.primaryColor,
                    ColorsUtility.accentColor
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'MONEYTRACKER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              transform: Matrix4.translationValues(0, -40, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          focusNode: _emailFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v){
                            FocusScope.of(context).requestFocus(_passFocus);
                          },
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          focusNode: _passFocus,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: _obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please enter your password";
                            }
                            else if(value.length < 8){
                              return "Password has to be of 8 characters";
                            }
                            return null;
                          },
                          obscureText: _obscureText,
                        ),
                        const SizedBox(height: 20),
                        Consumer<AuthProvider>(
                          builder: (context, authProvider, child) {
                            return _isLoadingEmail
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                              onPressed: () async {
                                if(_formKey.currentState!.validate()){
                                  setState(() {
                                    _isLoadingEmail = true;
                                  });
                                  await authProvider.signInWithEmail(
                                      _emailController.text, _passwordController.text);
                                  setState(() {
                                    _isLoadingEmail = false;
                                  });
                                  if (authProvider.user != null) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const HomeScreen()),
                                    );
                                  } else if (authProvider.errorMessage != null) {
                                    _passwordController.clear();
                                    _emailController.clear();
                                    Utility().showFlashError(context, authProvider.errorMessage!);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsUtility.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: const Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        Consumer<AuthProvider>(
                          builder: (context, authProvider, child) {
                            return _isLoadingGoogle
                                ? const CircularProgressIndicator()
                                : Card(
                              child: ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset("assets/icons/google.png"),
                                ),
                                title: const Text(
                                  "Join with Google",
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                onTap: () async {
                                  setState(() {
                                    _isLoadingGoogle = true;
                                  });
                                  await authProvider.signInWithGoogle();
                                  setState(() {
                                    _isLoadingGoogle = false;
                                  });
                                  if (authProvider.user != null) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const HomeScreen()),
                                    );
                                  } else if (authProvider.errorMessage != null) {
                                    Utility().showFlashError(context, authProvider.errorMessage!);
                                  }
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            );
                          },
                          child: const Text(
                            'Don\'t have an account? Sign up',
                            style: TextStyle(color: ColorsUtility.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
