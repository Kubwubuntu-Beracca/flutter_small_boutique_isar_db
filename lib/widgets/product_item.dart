import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridTile(
        child: Container(
          child: Text('Banane'),
        ),
        footer: const GridTileBar(
          leading: Text('Price'),
          title: Text('5000 FBU'),
        ),
      ),
    );
  }
}
