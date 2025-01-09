import 'package:flutter/material.dart';
import 'package:gojek/theme/theme.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      decoration: BoxDecoration(
        color: green700,
        borderRadius: BorderRadius.circular(999),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TabBarItem('Beranda', isSelected: true),
          _TabBarItem('Promo'),
          _TabBarItem('Pesanan'),
          _TabBarItem('Chat'),
        ],
      ),
    );
  }
}

class _TabBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _TabBarItem(this.title, {this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Handle tap event
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? green700 : neutral100,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: isSelected ? green700 : neutral200),
          ),
          child: Text(
            title,
            style: isSelected ? bodySemibold.copyWith(color: neutral100) : bodySemibold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}