import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/presentation/cat_detail/widget/cat_detail_widget.dart';
import 'package:cat_breeds/utils/style/custom_text_styles.dart';
import 'package:cat_breeds/utils/widget/custom_page/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CatDetailScreen extends StatelessWidget {
  final Cat cat;

  const CatDetailScreen({
    super.key,
    required this.cat
  });

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      appBar: AppBar(

        surfaceTintColor: Colors.transparent,
        title: Text(
          cat.name,
          style: CustomTextStyles.titleH3(
            isBold: true,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CatDatailWidget(
              cat: cat,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        cat.description,
                        style: CustomTextStyles.titleH4(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)?.countryOfOrigin ?? ''}: ',
                            style: CustomTextStyles.titleH4(isBold: true),
                          ),
                          Expanded(
                            child: Text(
                              cat.origin,
                              style: CustomTextStyles.titleH4(),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)?.intelligence ?? ''}: ',
                            style: CustomTextStyles.titleH4(isBold: true),
                          ),
                          Expanded(
                            child: Text(
                              '${cat.intelligence}',
                              style: CustomTextStyles.titleH5(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)?.adaptabillity ?? ''}: ',
                            style: CustomTextStyles.titleH4(isBold: true),
                          ),
                          Expanded(
                            child: Text(
                              '${cat.adaptability}',
                              style: CustomTextStyles.titleH5(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)?.childFriendly ?? ''}: ',
                            style: CustomTextStyles.titleH4(isBold: true),
                          ),
                          Expanded(
                            child: Text(
                              '${cat.childFriendly}',
                              style: CustomTextStyles.titleH5(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)?.energyLevel ?? ''}: ',
                            style: CustomTextStyles.titleH4(isBold: true),
                          ),
                          Expanded(
                            child: Text(
                              '${cat.energyLevel}',
                              style: CustomTextStyles.titleH5(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)?.lifeSpan ?? ''}: ',
                            style: CustomTextStyles.titleH4(isBold: true),
                          ),
                          Expanded(
                            child: Text(
                              cat.lifeSpan,
                              style: CustomTextStyles.titleH5(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      )
    );
  }
}