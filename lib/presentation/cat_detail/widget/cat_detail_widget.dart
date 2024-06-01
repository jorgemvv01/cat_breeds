import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/presentation/home/provider/home_provider.dart';
import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:cat_breeds/utils/images/custom_images.dart';
import 'package:cat_breeds/utils/style/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatDatailWidget extends ConsumerWidget {
  const CatDatailWidget({
    super.key,
    required this.cat
  });

  final Cat cat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final catImage = ref.watch(catImageProvider(cat.referenceImageId));
    return Stack(
      children: [
        cat.referenceImageId == null
        ? Image.asset(
            CustomImages.placeholder, 
            fit: BoxFit.cover,
            cacheHeight: size.height~/2,
            cacheWidth: size.width.toInt(),
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
                  cacheHeight: size.height~/2,
                  cacheWidth: size.width.toInt(),
                ),
                data: (data) => data != null && data.url.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: data.url,
                    fit: BoxFit.cover,
                    height: size.height/2,
                    width: double.infinity,
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
                        cacheHeight: size.height~/2,
                        cacheWidth: size.width.toInt(),
                      );
                    },
                  )
                  : Image.asset(
                      CustomImages.placeholder, 
                      fit: BoxFit.cover,
                      cacheHeight: size.height~/2,
                      cacheWidth: size.width.toInt(),
                    )
              )
        ),
        Positioned(
          bottom: 20,
          left: (size.width/2) - (size.width * 0.45),
          child: Container(
            width: size.width * 0.9,
            height: 40,
            decoration: BoxDecoration(
              color: CustomColors.quaternaryColor,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  cat.temperament,
                  style: CustomTextStyles.smallParagraph(
                    isBold: true,
                    color: CustomColors.secundaryColor
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}