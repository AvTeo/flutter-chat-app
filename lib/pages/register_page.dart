import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(
                  title: 'Register',
                ),
                Form(),
                Labels(
                  text1: "¿Already have an account?",
                  text2: "Log in now!",
                  routes: 'login',
                ),
                Terms(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            title: 'Name',
            icon: Icons.perm_identity,
            keyboardType: TextInputType.text,
            textController: _nameController,
          ),
          CustomInput(
            title: 'Email',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            textController: _emailController,
          ),
          CustomInput(
            title: 'Password',
            icon: Icons.lock_outline,
            textController: _passwordController,
            isPassword: true,
          ),
          BlueButton(
            text: 'Register',
            onPressed: () {
              print(_emailController);
              print(_passwordController);
            },
          ),
        ],
      ),
    );
  }
}
