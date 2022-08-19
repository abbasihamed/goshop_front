import 'package:flutter/material.dart';

class NvaBarListItems extends StatelessWidget {
  const NvaBarListItems({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: index == 9 ? 0 : 38, top: 28),
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {},
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Image.asset('assets/logos/goshop_logo.png'),
                    Positioned(
                      bottom: 0,
                      left: 5,
                      child: Row(
                        children: [
                          Image.asset('assets/logos/telegram.png', height: 18),
                          const SizedBox(width: 3),
                          Image.asset('assets/logos/whatsapp.png', height: 18),
                          const SizedBox(width: 3),
                          Image.asset('assets/logos/instagram.png', height: 18),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'فروشگاه:',
                    style: theme.textTheme.subtitle2,
                  ),
                  Text(
                    'بایلی شاپ',
                    style: theme.textTheme.subtitle2,
                  ),
                ],
              ),
              Text(
                'کالای دیجیتال',
                style: theme.textTheme.subtitle2,
              ),
              SizedBox(
                width: 200,
                height: 25,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: Color(0xFFFFD233),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
