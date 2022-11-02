import 'package:blockies_ethereum/blockie_painter.dart';
import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';

class CustomBlockie extends StatelessWidget {
  const CustomBlockie({
    super.key,
    required this.size,
    required this.data,
    this.shape,
    this.padding,
  });

  final double size;
  final String data;
  final BlockiesShape? shape;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final double calculatedSize = size / 64;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.hardEdge,
          child: Center(
            child: CustomPaint(
              painter: BlockiePainter(data, shape ?? BlockiesShape.square),
              size: Size(calculatedSize, calculatedSize),
            ),
          ),
        ),
      ),
    );
  }
}
