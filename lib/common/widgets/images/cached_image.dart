import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../service_locator.dart';

class CachedImage extends StatelessWidget {

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final int maxRetries;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.maxRetries = 3,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        
        /// 加载中的占位符
        placeholder: (context, url) => placeholder ?? _buildLoadingPlaceholder(),
        
        /// 错误时的占位符
        errorWidget: (context, url, error) {
          sl<Logger>().e('图片加载失败: $url, 错误: $error');
          return errorWidget ?? _buildErrorPlaceholder();
        },
        
        /// HTTP 头配置
        httpHeaders: const {
          'User-Agent': 'Mozilla/5.0 (compatible; Flutter App)',
        },
        
        /// 缓存配置
        fadeInDuration: const Duration(milliseconds: 300),
        fadeOutDuration: const Duration(milliseconds: 100),
      ),
    );
    
  }

  // 构建加载中的占位符
  Widget _buildLoadingPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[800],
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white54),
        ),
      ),
    );
  }

  /// 构建错误占位符
  Widget _buildErrorPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.broken_image_outlined,
            color: Colors.grey[400],
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            '图片加载失败',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
}