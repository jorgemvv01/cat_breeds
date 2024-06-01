import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/presentation/general_provider/theme_provider.dart';
import 'package:cat_breeds/utils/api/api.dart';
import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:cat_breeds/utils/style/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CarItem extends ConsumerWidget {
  const CarItem({
    super.key,
    required this.cat
  });

  final Cat cat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ref.read(darkModeProvider)
        ? CustomColors.secundaryColor
        : CustomColors.oppositeColor,
        border: Border.all(
          color: CustomColors.oppositeColor
        )
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
                  style: CustomTextStyles.titleH4(
                    isBold: true,
                  ),
                ),
                InkWell(
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
                        'Ver más...',
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
              height: 230,
              width: 230,
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
                  ? const Icon(
                      Icons.pets_outlined,
                      color: CustomColors.mainColor,
                      size: 230,
                    )
                  : Center(
                    child: CachedNetworkImage(
                        imageUrl: '${Api.image}${cat.referenceImageId!}.jpg',
                        fit: BoxFit.cover,
                        height: 230,
                        width: 230,
                        placeholder: (context, url){
                          return const SizedBox(
                            height: 115,
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: CustomColors.mainColor,
                                  backgroundColor: CustomColors.oppositeColor,
                                ),
                              ),
                            ),
                          );
                        },
                        errorWidget: (_, __, ___) {
                          return const Icon(
                            Icons.pets_outlined,
                            color: CustomColors.secundaryColor,
                            size: 230,
                          );
                        },
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
                        style: CustomTextStyles.titleH5(
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
                        style: CustomTextStyles.titleH5(
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