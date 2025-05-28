import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/text/drop_cap_text.dart';
import 'package:netflix/domain/person/entities/person.dart';

import '../../../common/widgets/images/cached_image.dart';
import '../../../core/configs/assets/app_images.dart';

class CreditInformation extends StatelessWidget {

  final PersonEntity person;

  const CreditInformation({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return DropCapText(
      person.biography ?? '',
      dropCapPadding: EdgeInsets.only(right: 15.0, bottom: 10.0),
      dropCap: DropCap(
        width: 130,
        height: 170,
        child: CachedImage(
          imageUrl: '${AppImages.creditImageBasePath}${person.profilePath}',
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      
    );
  }
}