import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabat_pos/screens/checkout.dart';
import 'package:talabat_pos/services/item_service.dart';
import 'package:talabat_pos/services/order_service.dart';
import 'package:talabat_pos/utils/spaces.dart';
import 'package:talabat_pos/utils/styles.dart';

import '../utils/color.dart';

class RightHome extends StatefulWidget {
  const RightHome({super.key});

  @override
  State<RightHome> createState() => _RightHomeState();
}

class _RightHomeState extends State<RightHome> {
  @override
  Widget build(BuildContext context) {
    final orderService = Provider.of<OrderService>(
      context,
    );
    /* return Consumer<orderService>(
        //future: context.read<CategoryService>().getCategories(),
        builder: (context, snapshot, _) { */

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClayContainer(
        color: AppColors.backGroundCategoryColor,
        spread: 1,
        borderRadius: 10,
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Cart " +
                        "${orderService.getOrder.items == null ? 0 : orderService.getOrder.items!.length}",
                    style: StylesApp.titleDescStyle,
                  ),
                  Text(
                    "Clear All ",
                    style: StylesApp.normalStyle,
                  ),
                ],
              ),
            ),

            orderService.getOrder.items == null
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width,
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: orderService.getOrder.items!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              width: MediaQuery.of(context).size.width * 0.06,
                              height: MediaQuery.of(context).size.height * 0.09,
                              orderService.getOrder.items![index].imagePath
                                  .toString(),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error);
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  );
                                }
                              },
                            ),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    orderService.getOrder.items![index].name
                                        .toString(),
                                    style: StylesApp.itemNameStyle,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        orderService.deleteItem(index);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: AppColors.scondaryColor,
                                        size: 20,
                                      ))
                                ],
                              ),
                              SpacesApp.spaceH_10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: ClayContainer(
                                          spread: 0,
                                          color: AppColors.primaryColor,
                                          borderRadius: 5,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.045,
                                          child: Center(
                                            child: Text(
                                              "-",
                                              style: StylesApp.minusStyleSelect,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SpacesApp.spaceW_10,
                                      Text(
                                        "1",
                                        style: StylesApp.itemNameStyle,
                                      ),
                                      SpacesApp.spaceW_10,
                                      InkWell(
                                        onTap: () {},
                                        child: ClayContainer(
                                          spread: 0,
                                          color: AppColors.primaryColor,
                                          borderRadius: 5,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.045,
                                          child: Center(
                                            child: Text(
                                              "+",
                                              style: StylesApp.minusStyleSelect,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    orderService.getOrder.items![index].price
                                        .toString(),
                                    style: StylesApp.itemNameStyle,
                                  ),
                                ],
                              ),
                              SpacesApp.spaceH_20,
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            SpacesApp.spaceH_10,

            ///calc
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SubTotal",
                    style: StylesApp.calcStyle,
                  ),
                  Text(
                    orderService.getOrder.subTotal == null
                        ? "0.0"
                        : orderService.getOrder.subTotal.toString(),
                    style: StylesApp.calcStyle,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount",
                    style: StylesApp.calcStyle,
                  ),
                  Text(
                    "0.0",
                    style: StylesApp.calcStyle,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "VAT",
                    style: StylesApp.calcStyle,
                  ),
                  Text(
                    "0.0",
                    style: StylesApp.calcStyle,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: StylesApp.totalStyle,
                  ),
                  Text(
                    orderService.getOrder.total == null
                        ? "0.0"
                        : orderService.getOrder.total.toString(),
                    style: StylesApp.totalStyle,
                  ),
                ],
              ),
            ),
            SpacesApp.spaceH_20,
            //bun Payment

            FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.2,
                    MediaQuery.of(context).size.height * 0.07),
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {
                if (orderService.getOrder.items!.isNotEmpty) {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const Checkout();
                      });
                }
              },
              child: Text("Checkout"),
            )
          ],
        ),
      ),
    );
  }
}
