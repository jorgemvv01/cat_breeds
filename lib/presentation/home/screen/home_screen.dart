import 'package:cat_breeds/config/theme/theme_provider.dart';
import 'package:cat_breeds/presentation/home/provider/home_provider.dart';
import 'package:cat_breeds/presentation/home/widget/cat_item.dart';
import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:cat_breeds/utils/style/custom_text_styles.dart';
import 'package:cat_breeds/utils/widget/custom_page.dart';
import 'package:cat_breeds/utils/widget/custom_search_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cats = ref.watch(catProvider);
    final darkMode = ref.watch(darkModeProvider);
    return CustomPage(
      body: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const SizedBox(
              height: 8,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CatBreeds',
                    style: CustomTextStyles.titleH3(isBold: true),
                  ),
                  IconButton(
                    onPressed: () => ref.read(darkModeProvider.notifier).toggleDarkMode(), 
                    icon: darkMode
                      ? const Icon(Icons.sunny)
                      : const Icon(Icons.dark_mode_outlined)
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomSearchText(
              width: double.infinity,
              height: 50,
              hint: AppLocalizations.of(context)?.searchByBreed ?? '',
              controller: ref.read(textControllerProvider),
              focusNode: ref.read(textFocusProvider),
              onSubmitted: (value){
                ref.read(searchTextProvider.notifier).search(value);
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: cats.when(
                data: (data) => RefreshIndicator(
                  backgroundColor: CustomColors.mainColor,
                  color: CustomColors.secundaryColor,
                  onRefresh: () async  {
                    ref.invalidate(catProvider);
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CarItem(
                          cat: data[index],
                        ),
                      );
                    },
                  ),
                ),
                loading: () => const Center(child: CircularProgressIndicator(
                  color: CustomColors.mainColor,
                )),
                error: (error, stackTrace) => Text('$error'),
              ),
            )
          ],
        ),
      ),
    );
  }
}