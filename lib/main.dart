import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/ui/home/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // ProviderScopeでラップして、riverpodが使えるようにする。
  runApp(const ProviderScope(child: LayeredArchitectureExample()));
}

class LayeredArchitectureExample extends StatelessWidget {
  const LayeredArchitectureExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layered architecture example')),
        body: const HomePage(),
      ),
    );
  }
}
