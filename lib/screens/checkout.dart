import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabat_pos/services/order_service.dart';
import 'package:talabat_pos/utils/color.dart';
import 'package:talabat_pos/utils/spaces.dart';
import 'package:talabat_pos/utils/styles.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final orderService = Provider.of<OrderService>(
      context,
    );
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0,
      child: ClayContainer(
        color: AppColors.white,
        borderRadius: 15,
        spread: 1,
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Checkout",
                  style: StylesApp.titleDescStyle,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.cancel_presentation_outlined,
                      color: AppColors.grey,
                    ))
              ],
            ),
          ),
          Divider(
            thickness: 0,
          ),
          orderService.getCheckoutDone
              ? Column(
                  children: [
                    ClayContainer(
                      borderRadius: 250,
                      color: AppColors.checkSucss,
                      surfaceColor: AppColors.checkSucss,
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.05,
                      spread: 2,
                      child: Icon(
                        size: 40,
                        Icons.check,
                        color: AppColors.white,
                      ),
                    ),
                    SpacesApp.spaceH_10,
                    const Text(
                      "Success",
                      style: StylesApp.titleDescStyle,
                    ),
                    SpacesApp.spaceH_10,
                    const Text(
                      "Your Order Has Been Placed Successfully",
                      style: StylesApp.normalStyle,
                    ),
                  ],
                )
              : Container(),
          SpacesApp.spaceH_20,
          ClayContainer(
            color: AppColors.backGroundCategoryColor,
            borderRadius: 15,
            spread: 1,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 8,
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
                ],
              ),
            ),
          ),
          SpacesApp.spaceH_20,
          orderService.getIsLoading
              ? CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )
              : OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.1,
                          MediaQuery.of(context).size.height * 0.05)),
                  onPressed: () async {
                    await orderService.checkout();

                    if (orderService.getCheckoutDone) {
                      Future.delayed(Duration(seconds: 1), () {
                        orderService.clearOrder();
                        Navigator.of(context).pop();
                      });
                    } else {
                      print("Not Successfully");
                    }
                  },
                  child: Center(
                      child: Text(
                    "Okay",
                    style: StylesApp.itemNameStyle,
                  )))
        ]),
      ),
    );
  }
}
