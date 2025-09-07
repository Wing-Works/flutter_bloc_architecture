import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.title,
    required this.subtitle,
    this.date,
    this.color = Colors.blueAccent,
    this.onTap,
    this.onAction,
    super.key,
  });

  final String title;
  final String subtitle;
  final DateTime? date;
  final Color color;
  final VoidCallback? onTap;
  final VoidCallback? onAction;

  String get _formattedDate {
    if (date == null) return '';
    final d = date!;
    return '${d.day}/${d.month}/${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0.6,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: onTap,
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
                backgroundColor: color.withOpacity(0.15),
                child: Text(
                  title.isNotEmpty ? title[0].toUpperCase() : '-',
                  style: TextStyle(
                    color: color,
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
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (subtitle.isNotEmpty)
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    if (_formattedDate.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        _formattedDate,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onAction,
                icon: const Icon(Icons.more_vert, color: Colors.black54),
                splashRadius: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
