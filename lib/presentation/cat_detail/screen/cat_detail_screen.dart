import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/utils/api/api.dart';
import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:cat_breeds/utils/style/custom_text_styles.dart';
import 'package:cat_breeds/utils/widget/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CatDetailScreen extends StatelessWidget {
  const CatDetailScreen({
    super.key,
    required this.cat
  });

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPage(
      appBar: AppBar(
        foregroundColor: CustomColors.oppositeColor,
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
            Stack(
              children: [
                cat.referenceImageId == null
                ? const Icon(
                    Icons.pets_outlined,
                    color: CustomColors.mainColor,
                    size: 230,
                  )
                : Center(
                    child: CachedNetworkImage(
                        imageUrl: '${Api.image}${cat.referenceImageId!}.jpg',
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
                  ),
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
                          style: CustomTextStyles.titleH4(
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
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
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
                            'País de origen: ',
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
                            'Inteligencia: ',
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
                            'Adaptabilidad: ',
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
                            'Apto para niños: ',
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
                            'Nivel energía: ',
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
                      const SizedBox(
                        height: 20,
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