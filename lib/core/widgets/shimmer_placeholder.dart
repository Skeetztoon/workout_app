import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:workout_diary_bloc/theme/colors.dart';

class ShimmerPlaceholder extends StatefulWidget {
  const ShimmerPlaceholder({super.key, required this.width, required this.height, required this.color});

  final double width;
  final double height;
  final Color color;

  @override
  State<ShimmerPlaceholder> createState() => _ShimmerPlaceholderState();
}

class _ShimmerPlaceholderState extends State<ShimmerPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:widget.color,
      highlightColor: Colors.grey,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyColors.darkGreyColor
        ),
      ),
    );
  }
}