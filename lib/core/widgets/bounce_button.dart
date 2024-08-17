import 'package:flutter/material.dart';

class BounceButton extends StatefulWidget {
  const BounceButton({
    super.key,
    required this.onTap,
    this.child,
    this.scaleAmount = 0.05,
    this.awaitBackAnimation = false,
  });

  final Widget? child;
  final void Function() onTap;
  final double scaleAmount;
  final bool awaitBackAnimation;

  @override
  State<BounceButton> createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void>? awaitAnimationFunction;
    return GestureDetector(
      onTapUp: (details) async {
        await awaitAnimationFunction;
        _animationController.animateBack(_animationController.lowerBound);
      },
      onTapCancel: () async {
        await awaitAnimationFunction;
        _animationController.animateBack(_animationController.lowerBound);
      },
      onTapDown: (details) {
        awaitAnimationFunction = _animationController.forward();
      },
      onTap: () async {
        if (widget.awaitBackAnimation) {
          await awaitAnimationFunction;
        }
        widget.onTap();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 - widget.scaleAmount * _animationController.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}