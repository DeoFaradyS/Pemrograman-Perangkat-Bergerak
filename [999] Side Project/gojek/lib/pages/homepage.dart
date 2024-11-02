import 'package:flutter/material.dart';
import 'package:gojek/theme/theme.dart';
import '../components/tab_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: green500,
        title: TabBarWidget(),
      ),
      body: const Center(
        child: Text(
          'Homepage',
        ),
      ),
    );
  }
}
