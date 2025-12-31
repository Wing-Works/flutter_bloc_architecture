import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/product_page/product_page_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({required this.item, super.key});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16).r,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _navigateToProductPage(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageSection(context),
              const SizedBox(height: 8),
              _buildTitle(theme),
              const SizedBox(height: 4),
              _buildInfoRow(theme),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the image section with proper error and loading handling
  Widget _buildImageSection(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
        borderRadius: BorderRadius.circular(12).r,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12).r,
        child: item.thumbnail.isNotEmpty
            ? Hero(
                tag: 'product_${item.id}',
                child: Image.network(
                  item.thumbnail,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder(context);
                  },
                ),
              )
            : _buildPlaceholder(context),
      ),
    );
  }

  /// Builds placeholder when image is unavailable
  Widget _buildPlaceholder(BuildContext context) {
    final initial = item.title.isNotEmpty
        ? item.title.trim()[0].toUpperCase()
        : '?';

    return Center(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            initial,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the product title with overflow handling
  Widget _buildTitle(ThemeData theme) {
    return Text(
      item.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
    );
  }

  /// Builds the rating and price information row
  Widget _buildInfoRow(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating section
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_rounded,
                size: 14,
                color: Colors.amber[700],
              ),
              const SizedBox(width: 4),
              Text(
                item.rating.toStringAsFixed(1),
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // Price section
        Text(
          '\$${item.price.toStringAsFixed(2)}',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }

  /// Navigates to the product detail page
  void _navigateToProductPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      ProductPageScreen.routeName,
      arguments: {'id': item.id},
    );
  }
}

// Enhanced version with shimmer loading (optional - requires shimmer package)
class ItemCardWithShimmer extends StatelessWidget {
  const ItemCardWithShimmer({required this.item, super.key});

  final ProductModel item;

  static const double _cardElevation = 2;
  static const double _borderRadius = 16;
  static const double _imageHeight = 140;
  static const double _cardPadding = 12;
  static const double _contentSpacing = 8;
  static const double _ratingIconSize = 14;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: _cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          ProductPageScreen.routeName,
          arguments: {'id': item.id},
        ),
        child: Padding(
          padding: const EdgeInsets.all(_cardPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageWithFadeIn(context),
              const SizedBox(height: _contentSpacing),
              _buildTitle(theme),
              const SizedBox(height: _contentSpacing / 2),
              _buildInfoRow(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithFadeIn(BuildContext context) {
    return Container(
      height: _imageHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
        borderRadius: BorderRadius.circular(_borderRadius - 4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius - 4),
        child: item.thumbnail.isNotEmpty
            ? Hero(
                tag: 'product_${item.id}',
                child: FadeInImage.assetNetwork(
                  placeholder:
                      'assets/images/placeholder.png', // Add your placeholder
                  image: item.thumbnail,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder(context);
                  },
                ),
              )
            : _buildPlaceholder(context),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final initial = item.title.isNotEmpty
        ? item.title.trim()[0].toUpperCase()
        : '?';

    return Center(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            initial,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Text(
      item.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
    );
  }

  Widget _buildInfoRow(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_rounded,
                size: _ratingIconSize,
                color: Colors.amber[700],
              ),
              const SizedBox(width: 4),
              Text(
                item.rating.toStringAsFixed(1),
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Text(
          '\$${item.price.toStringAsFixed(2)}',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
