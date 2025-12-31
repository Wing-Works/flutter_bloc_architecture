import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/stateful/base_stateful_widget.dart';
import 'package:flutter_bloc_architecture/src/product_page/bloc/product_page_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPageScreen extends BaseStatefulWidget<ProductPageBloc> {
  const ProductPageScreen(super.bloc, {required this.productId, super.key});

  static const String routeName = '/product_page';

  final int productId;

  @override
  State<ProductPageScreen> createState() => _ProductPageScreenState();
}

class _ProductPageScreenState
    extends BasePageState<ProductPageBloc, ProductPageScreen> {
  @override
  bool get extendBodyBehindAppBar => true;

  @override
  void initState() {
    super.initState();
    bloc.fetchData(widget.productId);
  }

  @override
  PreferredSizeWidget? buildAppbar(BuildContext context, ProductPageBloc bloc) {
    final theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.cardColor.withOpacity(0.9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: theme.iconTheme.color,
            size: 18,
          ),
        ),
        onPressed: Navigator.of(context).pop,
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.cardColor.withOpacity(0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.favorite_border,
              color: theme.iconTheme.color,
              size: 20,
            ),
          ),
          onPressed: () {
            // Handle favorite action
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Widget buildView(BuildContext context, ProductPageBloc bloc) {
    return BlocBuilder<ProductPageBloc, ProductPageState>(
      builder: (context, state) {
        final product = state.productModel;
        final theme = Theme.of(context);

        return Stack(
          children: [
            // Scrollable content
            CustomScrollView(
              slivers: [
                _buildImageSection(product),

                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductHeader(product),
                        _buildRatingAndStock(product),
                        _buildDescription(product),
                        _buildQuantitySelector(),
                        const SizedBox(height: 100), // Space for bottom button
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Fixed bottom button
            _buildBottomBar(product),
          ],
        );
      },
    );
  }

  /// Builds the product image section with Hero animation
  Widget _buildImageSection(ProductModel product) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 400,
        child: Hero(
          tag: 'product_${product.id}',
          child: Image.network(
            product.thumbnail.isNotEmpty
                ? product.thumbnail
                : 'https://via.placeholder.com/400',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 64,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Builds the product header (title and price)
  Widget _buildProductHeader(ProductModel product) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: theme.textTheme.headlineMedium?.color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.brand,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: theme.textTheme.bodyMedium?.color,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: theme.primaryColor,
                ),
              ),
              if (product.discountPercentage > 0) ...[
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${product.discountPercentage.toStringAsFixed(0)}% OFF',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.red[700],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  /// Builds rating and stock information
  Widget _buildRatingAndStock(ProductModel product) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amber[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star_rounded, size: 18, color: Colors.amber[700]),
                const SizedBox(width: 4),
                Text(
                  product.rating.toStringAsFixed(1),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black, // Keep black on light bg
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: product.stock > 10 ? Colors.green[50] : Colors.orange[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  size: 16,
                  color: product.stock > 10
                      ? Colors.green[700]
                      : Colors.orange[700],
                ),
                const SizedBox(width: 4),
                Text(
                  '${product.stock} in stock',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: product.stock > 10
                        ? Colors.green[700]
                        : Colors.orange[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the product description section
  Widget _buildDescription(ProductModel product) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: theme.textTheme.headlineMedium?.color,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.description.isNotEmpty
                ? product.description
                : 'No description available',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: theme.textTheme.bodyMedium?.color,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the quantity selector
  Widget _buildQuantitySelector() {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quantity',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: theme.textTheme.headlineMedium?.color,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: theme.dividerColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, size: 20),
                  onPressed: () {},
                  color: theme.iconTheme.color,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    '1',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, size: 20),
                  onPressed: () {},
                  color: theme.iconTheme.color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the bottom action bar
  Widget _buildBottomBar(ProductModel product) {
    final theme = Theme.of(context);
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total Price',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label: Text(
                    'Add to Basket',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds error state
  Widget _buildErrorState(String? message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message ?? 'Failed to load product details',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => bloc.fetchData(widget.productId),
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
