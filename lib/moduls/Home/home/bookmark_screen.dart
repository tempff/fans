import 'package:fans/moduls/Home/home/home_screen.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  void initState() {
    super.initState();
    kHomeController.bookMarkApiCall({}, () {});
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        appBar: commonAppBar(),
        context: context,
        child: RawScrollbar(
          thickness: 5.0,
          thumbColor: colorSplash.withOpacity(0.5),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                30.heightBox,
                Obx(
                  () => kHomeController.bookMarkModel.value.data?.updates?.isNotEmpty == true
                      ? ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: kHomeController.bookMarkModel.value.data?.updates?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return commonPost(context,
                                postIndex: index,
                                data: 'bookmark',
                                bookmarkId : kHomeController.bookMarkModel.value.data?.updates?[index].id,
                                name: kHomeController.bookMarkModel.value.data?.updates?[index].fileName,
                                date: kHomeController.bookMarkModel.value.data?.updates?[index].date,
                                commentsCounts: kHomeController.bookMarkModel.value.data?.updates?[index].commentCount.toString(),
                                likeCounts: kHomeController.bookMarkModel.value.data?.updates?[index].likeCount ?? 0,
                                price: kHomeController.bookMarkModel.value.data?.updates?[index].price,
                                username: kHomeController.bookMarkModel.value.data?.updates?[index].fileName,
                                description: kHomeController.bookMarkModel.value.data?.updates?[index].description ?? '',
                               isBookmarked: kHomeController.bookMarkModel.value.data?.updates?[index].isBookmarked,
                          );
                          })
                      : SizedBox(
                          height: getScreenHeight(context) * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.bookmark_border,
                                size: 90,
                                color: isDarkOn.value == true ? colorLightWhite : colorGreyOpacity30,
                              ),
                              20.heightBox,
                              Text(
                                'No Book Mark Yet',
                                style: FontStyleUtility.greyInter18W500.copyWith(
                                  color: isDarkOn.value == true ? colorLightWhite : colorGreyOpacity30,
                                ),
                              ),
                              5.heightBox,
                            ],
                          ),
                        ),
                ),
                /*Column(
                  children:  [
                    const Icon(Icons.bookmark_border,size: 80.0,color: colorGrey,),
                    Text('No Book Mark Yet',style: FontStyleUtility.greyInter16W500.copyWith(fontSize: 20),)
                  ],
                )*/
              ],
            ),
          ),
        ));
  }
}
