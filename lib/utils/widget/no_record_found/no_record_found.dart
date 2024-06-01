import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:cat_breeds/utils/style/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoRecordFound extends StatelessWidget {
  const NoRecordFound({
    super.key,
    this.onPressed,
    this.showReload = false
  });

  final bool showReload;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.info_outline_rounded,
        ),
        Text(
          AppLocalizations.of(context)?.noRecordsFound ?? '',
          style: CustomTextStyles.paragraph(),
        ),
        if(showReload)
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: CustomColors.mainColor,
            foregroundColor: CustomColors.secundaryColor,
            splashFactory: NoSplash.splashFactory,
            shadowColor: null,
            surfaceTintColor: null
          ),
          onPressed: onPressed,
          child: Text(
            AppLocalizations.of(context)?.reload ?? '',
            style: CustomTextStyles.titleH5(
              color: CustomColors.secundaryColor
            ),
          )
        ),
      ],
    );
  }
}