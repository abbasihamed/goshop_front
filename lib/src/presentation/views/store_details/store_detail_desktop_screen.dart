import 'package:flutter/material.dart';
import 'package:goshop/src/presentation/components/top_bar.dart';

class StoreDetailDesktopScreen extends StatelessWidget {
  const StoreDetailDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const TopBar(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 600,
                              width: 150,
                              child: ListView.builder(
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Image.asset(
                                        'assets/logos/goshop_logo.png'),
                                  );
                                },
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 600,
                              child: Image.asset(
                                'assets/logos/goshop_logo.png',
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'بایلی شاپ',
                                style: theme.textTheme.headline6!.copyWith(
                                    color: theme.colorScheme.secondary),
                              ),
                              const SizedBox(height: 36),
                              Text(
                                'توضیحات:',
                                style: theme.textTheme.subtitle1,
                              ),
                              const SizedBox(height: 16),
                              Container(
                                height: 300,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
