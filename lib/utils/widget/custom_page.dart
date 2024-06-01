import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.body,
    this.appBar
  });

  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: appBar,
          body: Column(
            children: [
              Expanded(
                child: body
              )
            ],
          ),
        ),
      ),
    );
  }
}