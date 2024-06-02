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
          borderRadius: BorderRadius.circular(widget.height/3),
        ),
        child: TextField(
          key: const ValueKey('search-text-field-wg'),
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          style: CustomTextStyles.paragraph(),
          maxLines: 1,
          onSubmitted: (value) => setState(() {
            widget.onSubmitted(value);
          }),
          onChanged: (value) => setState(() {}),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(16, (widget.height/ 4), 10, 10),
            border: InputBorder.none,
            hintStyle: CustomTextStyles.paragraph(),
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
