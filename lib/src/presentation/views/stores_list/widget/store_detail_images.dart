import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/core/constants.dart';
import 'package:goshop/src/presentation/logic/get_store_controller.dart';

class StoreDetailImages extends StatelessWidget {
  const StoreDetailImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoresController>(
      builder: (store) {
        return Row(
          children: [
            SizedBox(
              height: 500,
              width: 130,
              child: ListView.builder(
                itemCount: store.store?.images!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: store.store?.images![index].image != null
                        ? Image.network(
                            '$baseUrl/${store.store?.images![index].image}',
                            fit: BoxFit.cover,
                          )
                        : Image.asset('assets/logos/goshop_logo.png'),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              height: 510,
              width: 500,
              child: store.store?.images![0].image != null
                  ? Image.network(
                      '$baseUrl/${store.store?.images![0].image}',
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/logos/goshop_logo.png'),
            )
          ],
        );
      },
    );
  }
}
