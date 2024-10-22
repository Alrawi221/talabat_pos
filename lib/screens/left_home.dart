import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabat_pos/models/category_model.dart';
import 'package:talabat_pos/models/item_model.dart';
import 'package:talabat_pos/services/category_service.dart';
import 'package:talabat_pos/services/item_service.dart';
import 'package:talabat_pos/services/order_service.dart';
import 'package:talabat_pos/utils/color.dart';
import 'package:talabat_pos/utils/images.dart';
import 'package:talabat_pos/utils/spaces.dart';
import 'package:talabat_pos/utils/styles.dart';

class LeftHome extends StatefulWidget {
  const LeftHome({super.key});

  @override
  State<LeftHome> createState() => _LeftHomeState();
}

class _LeftHomeState extends State<LeftHome> {
  @override
  void initState() {
    final categoryService =
        Provider.of<CategoryService>(context, listen: false);
    categoryService.getCategories();

    final itemService = Provider.of<ItemService>(context, listen: false);
    itemService.getItems(categoryService.getIndexCategory);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(
      context,
    );
    final itemService = Provider.of<ItemService>(
      context,
    );
    final orderService = Provider.of<OrderService>(
      context,
    );
    /*  return Consumer<CategoryService>(
        child: Text("data"),
        //future: context.read<CategoryService>().getCategories(),
        builder: (context, snapshot, _) { */
    if (categoryService.categoryModel == null) {
      return Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ));
    }

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImageApp.logo,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Icon(
                Icons.language_outlined,
                color: AppColors.primaryColor,
              )
            ],
          ),
          SpacesApp.spaceH_30,
          /*  _categories(context, snapshot), */

          ClayContainer(
            color: AppColors.backGroundCategoryColor,
            borderRadius: 10,
            width: MediaQuery.of(context).size.width,
            spread: 1,
            emboss: true,
            depth: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choose From Main Categories",
                    style: StylesApp.titleDescStyle,
                  ),
                  SpacesApp.spaceH_10,
                  /*  Consumer<CategoryService>(
                  builder: (BuildContext context, CategoryService value, Widget? child) {  },
                  child: */

                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryService.categoryModel!.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            categoryService.setIndexCategory = index + 1;
                            itemService.itemModel = null;
                            await itemService.getItems(index + 1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClayContainer(
                              color: AppColors.white,
                              surfaceColor:
                                  categoryService.getIndexCategory == index + 1
                                      ? AppColors.scondaryColor
                                      : null,
                              parentColor: AppColors.scondaryColor,
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.07,
                              spread: 1,
                              child: Center(
                                  child: Text(
                                categoryService
                                    .categoryModel!.data![index].name!,
                                style: categoryService.getIndexCategory ==
                                        index + 1
                                    ? StylesApp.categoryNormalStyleSelect
                                    : StylesApp.categoryNormalStyle,
                              )),
                            ),
                          ),
                        );
                      },
                    ),
                  )

                  // ),
                ],
              ),
            ),
          ),
          SpacesApp.spaceH_10,
          const Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Text(
              "Fried",
              style: StylesApp.titleDescStyle,
            ),
          ),
          itemService.itemModel == null
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    itemCount: itemService.itemModel!.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            orderService.setItemOrder =
                                itemService.itemModel!.data![index];

                            orderService.calc();
                          },
                          child: Container(
                            /*   color: AppColors.white,
                        spread: 1, */
                            width: MediaQuery.of(context).size.width * 0.07,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    itemService
                                        .itemModel!.data![index].imagePath
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
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.primaryColor,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 8),
                                  child: Text(
                                    itemService.itemModel!.data![index].name
                                        .toString(),
                                    style: StylesApp.normalStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      itemService.itemModel!.data![index].price
                                          .toString(),
                                      style: StylesApp.priceNormalStyle),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )

          // _items(context, itemService),
        ],
      ),
    );
  }
}

/* Widget _categories(context, snapshot) {
  return } */

Widget _items(context, itemService) {
  /*  return Consumer<ItemService>(
      //future: context.read<CategoryService>().getCategories(),
      builder: (context, snapshot, _) { */
  if (itemService.itemModel == null) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
  return Container(
    height: MediaQuery.of(context).size.height * 0.4,
    width: MediaQuery.of(context).size.width,
    child: GridView.builder(
      itemCount: itemService.itemModel!.data!.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              itemService.itemData.add(itemService.itemModel!.data![index]);
            },
            child: Container(
              /*   color: AppColors.white,
                        spread: 1, */
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.height * 0.02,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      itemService.itemModel!.data![index].imagePath.toString(),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Text(
                      itemService.itemModel!.data![index].name.toString(),
                      style: StylesApp.normalStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        itemService.itemModel!.data![index].price.toString(),
                        style: StylesApp.priceNormalStyle),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
