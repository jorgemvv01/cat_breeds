import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:cat_breeds/utils/style/custom_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchText extends StatefulWidget {
  final String hint;
  final Function(String) onSubmitted;
  final double width;
  final double height;
  final TextInputType? keyboardType;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Color colorBorder;

  final bool isRestrictCharacters;
  final String restrictCharacters;

  const CustomSearchText({
    super.key,
    required this.onSubmitted,
    this.hint = '',
    this.width = 200,
    this.height = 50,
    this.keyboardType,
    this.colorBorder = Colors.grey,
    required this.controller,
    required this.focusNode,
    this.isRestrictCharacters = true,
    this.restrictCharacters = "",
  });

  @override
  State<CustomSearchText> createState() => _CustomSearchTextState();
}

class _CustomSearchTextState extends State<CustomSearchText> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.2,
      borderRadius: BorderRadius.circular(widget.height/3),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: CustomColors.oppositeColor,
          borderRadius: BorderRadius.circular(widget.height/3),
        ),
        child: TextField(
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          style: CustomTextStyles.paragraph(
            color: CustomColors.secundaryColor
          ),
          maxLines: 1,
          onSubmitted: (value) => setState(() {
            widget.onSubmitted(value);
          }),
          onChanged: (value) => setState(() {}),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(16, (widget.height/ 4), 10, 10),
            border: InputBorder.none,
            hintStyle: CustomTextStyles.paragraph(
              color: CustomColors.secundaryColor
            ),
            hintText: widget.hint,
            suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                icon: const Icon(Icons.cancel_outlined),
                onPressed: () {
                  widget.controller.text = "";
                  widget.onSubmitted(widget.controller.text);
                },
              )
              : IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () {
                  widget.focusNode.unfocus();
                  widget.onSubmitted(widget.controller.text);
                },
              )
          ),
        ),
      ),
    );
  }
}
