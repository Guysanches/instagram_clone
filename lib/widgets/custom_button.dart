import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String textButton;
  final VoidCallback onTap;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.textButton,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child: widget.isLoading == false
            ? Text(widget.textButton)
            : const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const ShapeDecoration(
          color: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
