import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app_riverpod/auth_provider.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (previous, next) {
      if (next) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SuccessScreen(),
            ));
        ref.invalidate(authNotifierProvider);
      }
    });

    final authNotifier = ref.watch(authNotifierProvider.notifier);
    ref.watch(authNotifierProvider);
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: const Text('Employees'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 100),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: authNotifier.emailError),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: authNotifier.passwordError),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  authNotifier.login(
                      email: _emailController.text,
                      password: _passwordController.text);
                },
                child: const Text('Login'))
          ],
        ));
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Success screen',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
