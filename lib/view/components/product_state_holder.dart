import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductStateHolder extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        width: 80,
        height: 30,
        margin: EdgeInsets.only(top: 10, left: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)),
        child: const Text(
          "State",
          style: TextStyle(color: Colors.white),
        ),
      );
}
