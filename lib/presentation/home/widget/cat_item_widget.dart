import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/presentation/home/provider/home_provider.dart';
import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:cat_breeds/utils/images/custom_images.dart';
import 'package:cat_breeds/utils/style/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarItemWidget extends ConsumerWidget {
  const CarItemWidget({
    super.key,
    required this.cat
  });

  final Cat cat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final catImage = ref.watch(catImageProvider(cat.referenceImageId));
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cat.name,
                  style: CustomTextStyles.titleH2(
                    isBold: true,
                  ),
                ),
                InkWell(
                  key: const ValueKey('see-more-wg'),
                  onTap: (){
                    context.push('/cat-detail', extra: cat);
                  },
                  child: Container(
                    height: 30,
                    width: 82,
                    decoration: BoxDecoration(
                      color: CustomColors.mainColor,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)?.seeMore ?? '',
                        style: CustomTextStyles.smallParagraph(
                          isBold: true,
                          color: CustomColors.secundaryColor
                        ),
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              height: size.height * 0.26,
              width: size.height * 0.26,
              decoration: BoxDecoration(
                color: CustomColors.tertiaryColor,
                borderRadius: BorderRadius.circular(150),
                border: Border.all(
                  width: 6,
                  color: CustomColors.tertiaryColor
                )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: cat.referenceImageId == null
                  ? Image.asset(
                      CustomImages.placeholder, 
                      fit: BoxFit.cover,
                      cacheHeight: (size.height * 0.26).toInt(),
                      cacheWidth: (size.height * 0.26).toInt(),
                    )
                  : Center(
                      child: 
                        catImage.when(
                          loading: () => const CircularProgressIndicator(
                            color: CustomColors.mainColor,
                          ),
                          error: (error, stackTrace) => Image.asset(
                            CustomImages.placeholder, 
                            fit: BoxFit.cover,
                            cacheHeight: (size.height * 0.26).toInt(),
                            cacheWidth: (size.height * 0.26).toInt(),
                          ),
                          data: (data) => data != null && data.url.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: data.url,
                              fit: BoxFit.cover,
                              height: size.height * 0.26,
                              width: size.height * 0.26,
                              placeholder: (context, url){
                                return const SizedBox(
                                  height: 115,
                                  child: Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: CustomColors.mainColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (_, __, ___) {
                                return Image.asset(
                                  CustomImages.placeholder, 
                                  fit: BoxFit.cover,
                                  cacheHeight: (size.height * 0.26).toInt(),
                                  cacheWidth: (size.height * 0.26).toInt(),
                                );
                              },
                            )
                            : Image.asset(
                                CustomImages.placeholder, 
                                fit: BoxFit.cover,
                                cacheHeight: (size.height * 0.26).toInt(),
                                cacheWidth: (size.height * 0.26).toInt(),
                              )
                        )
                  ),
              )
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
              color: CustomColors.tertiaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)
              )
            ),
            height: 62,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.public,
                        color: CustomColors.secundaryColor,
                      ),
                      Text(
                        cat.origin,
                        style: CustomTextStyles.titleH3(
                          color: CustomColors.secundaryColor
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.psychology,
                        size: 32,
                        color: CustomColors.secundaryColor,
                      ),
                      Text(
                        '${cat.intelligence}',
                        style: CustomTextStyles.titleH3(
                          color: CustomColors.secundaryColor
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}