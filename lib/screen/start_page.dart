import 'package:shoes_shop/screen/home_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shoes shop"),
        centerTitle: true,
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage())),
          child: const Text("Home screen"),
        ),
      ),
    );
  }
}
