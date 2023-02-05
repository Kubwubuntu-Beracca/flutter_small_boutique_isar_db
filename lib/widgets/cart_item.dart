import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartWidget extends StatelessWidget {
  final String? value;
  Widget child;
  CartWidget({required this.value, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              textAlign: TextAlign.center,
              value!,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
