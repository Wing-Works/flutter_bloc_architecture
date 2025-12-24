import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/product_page/product_page_screen.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({required this.item, super.key});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).primaryColor;
    return Card(
      elevation: 2,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () => Navigator.pushNamed(
          context,
          ProductPageScreen.routeName,
          arguments: {'id': item.id},
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: cardColor.withAlpha(38),
                child: Text(
                  item.title.isNotEmpty ? item.title[0].toUpperCase() : '-',
                  style: TextStyle(
                    color: cardColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (item.category.isNotEmpty)
                      Text(
                        item.category,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    if (_formattedDate.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        _formattedDate,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).iconTheme.color,
                ),
                splashRadius: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get _formattedDate => '';
}
