import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabat_pos/models/category_model.dart';
import 'package:talabat_pos/services/category_service.dart';
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        ClayContainer(
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
                Text(
                  "Choose From Main Categories",
                  style: StylesApp.titleDescStyle,
                ),
                SpacesApp.spaceH_10,
               /*  Consumer<CategoryService>(
                  builder: (BuildContext context, CategoryService value, Widget? child) {  },
                  child: */ FutureBuilder<CategoryModel>(
                    future: Provider.of<CategoryService>(context, listen: false)
                        .getCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text('حدث   خطأ أثناء جلب البيانات'));
                      } else if (snapshot.hasData) {
                        final categories = snapshot.data!.data;

                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClayContainer(
                                    parentColor: AppColors.scondaryColor,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.width *
                                        0.07,
                                    spread: 1,
                                    child: Center(
                                        child: Text(categories[index].name!)),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(child: Text('لا توجد بيانات'));
                      }
                    },
                  ),
              // ),
              ],
            ),
          ),
        ),
        SpacesApp.spaceH_10,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Fried",
            style: StylesApp.titleDescStyle,
          ),
        ),
        SpacesApp.spaceH_10,
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: FutureBuilder<CategoryModel>(
              future: Provider.of<CategoryService>(context, listen: false)
                  .getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  /// set the data

                  return GridView.builder(
                    itemCount: snapshot.data!.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: ClayContainer(
                            spread: 1,
                            width: MediaQuery.of(context).size.width * 0.07,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Column(
                              children: [
                                Image.asset(
                                  ImageApp.posLogo,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                Center(child: Text("data")),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return LinearProgressIndicator(
                  color: AppColors.primaryColor,
                );
              }),
        )
      ]),
    );
  }
}
