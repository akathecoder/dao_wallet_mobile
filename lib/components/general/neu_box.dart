import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  const NeuBox({
    Key? key,
    required this.child,
    this.shape,
  }) : super(key: key);

  final Widget child;
  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: shape ?? BoxShape.rectangle,
        borderRadius:
            shape == BoxShape.circle ? null : BorderRadius.circular(12),
        boxShadow: [
          // darker shadow on the bottom right
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),

          // lighter shadow on the top left
          const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-5, -5),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
