import 'package:flutter/material.dart';
import 'package:shoes_shop/screen/start_page.dart';

void main() {
  runApp(const ArtShop());
}

class ArtShop extends StatefulWidget {
  const ArtShop({Key? key}) : super(key: key);

  @override
  State<ArtShop> createState() => _ArtShopState();
}

class _ArtShopState extends State<ArtShop> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartPage(),
    );
  }
}
