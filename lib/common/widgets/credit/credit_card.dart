import 'package:flutter/material.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/configs/assets/app_images.dart';
import 'package:netflix/domain/movie/entities/credit.dart';

import '../../../presentation/credit/pages/credit.dart';
import '../images/cached_image.dart';

class CreditCard extends StatelessWidget {
  final CreditEntity credit;

  const CreditCard({super.key, required this.credit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, CreditPage(personId: credit.id!));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          /**
           * 演员头像容器
           * 使用圆角设计，显示演员的头像图片
           */
          CachedImage(
            imageUrl: '${AppImages.creditImageBasePath}${credit.profilePath}',
            width: 100,
            height: 120,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(10),
          ),

          SizedBox(height: 10),

          /**
           * 演员信息展示区域
           * 显示演员的姓名信息
           */
          SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  credit.name ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 4),
                Text(
                  credit.originalName ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
