import 'package:flutter/material.dart';
import 'package:netflix/core/configs/assets/app_images.dart';
import 'package:netflix/domain/movie/entities/credit.dart';

class CreditCard extends StatelessWidget {
  final CreditEntity credit;

  const CreditCard({super.key, required this.credit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          /**
           * 演员头像容器
           * 使用圆角设计，显示演员的头像图片
           */
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  '${AppImages.creditImageBasePath}${credit.profilePath}',
                ),
              ),
              borderRadius: BorderRadius.circular(10), // 圆角设计
            ),
          ),
      
          /**
           * 演员信息展示区域
           * 显示演员的姓名信息
           */
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                credit.name ?? '',
                style: TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              SizedBox(height: 4),
              Text(
                credit.originalName ?? '', // 这里应该显示角色名称，但当前使用的是 MovieEntity
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
