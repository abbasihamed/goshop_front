import 'package:flutter/material.dart';


class StoreRating extends StatelessWidget {
  final ThemeData theme;
  const StoreRating({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.secondary),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 20,
            margin: const EdgeInsets.only(bottom: 34),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              '3 از 5',
              style: theme.textTheme.subtitle2!.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.yellow,
                      ),
                      Text(
                        '5',
                        style:
                            theme.textTheme.subtitle2!.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(width: 4),
                  Container(
                    height: 20,
                    width: 590,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9D9D98).withOpacity(.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 20,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}