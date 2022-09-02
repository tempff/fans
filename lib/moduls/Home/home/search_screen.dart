import 'package:cached_network_image/cached_network_image.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(
          leadingIcon: StreamBuilder<Object>(
              stream: isDarkOn.stream,
              builder: (context, snapshot) {
                return IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: isDarkOn.value == true ? colorWhite : colorBlack,
                  ).paddingOnly(top: 10),
                );
              }),
          titleWidget: Container(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: commonTextField(
                filledColor: appBarColor,
                hintText: 'Search',
                textEditingController: null,
                borderOpacity: 0.0,
                contentPadding: EdgeInsets.zero,
                borderRadiusColor: deepPurpleColor.withOpacity(0.0),
                hintStyle: FontStyleUtility.whiteInter16W500,
                isBorder: true,
                textStyle: FontStyleUtility.whiteInter16W500,
                onChangedFunction: (value) {
                  Map<String, dynamic> params = {'user': value.toString()};
                  kHomeController.searchHomeApiCall(params, () {});
                },
                preFixWidget: const Icon(
                  Icons.search,
                  color: colorWhite,
                )),
          ),
          height: 60.0,
        ),
        child: Obx(() {
          return kHomeController.searchHomeModel.value.data?.data?.isNotEmpty == true
              ? ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const ClampingScrollPhysics(),
                  itemCount: kHomeController.searchHomeModel.value.data?.data?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              kHomeController.searchHomeModel.value.data?.data?[index]?.name ?? '',
                              style: blackInter15W500.copyWith(
                                  color: isDarkOn.value == true ? colorLightWhite : colorBlack, fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              '@${kHomeController.searchHomeModel.value.data?.data?[index]?.username ?? ' '}',
                              style:
                                  blackInter14W500.copyWith(color: isDarkOn.value == true ? colorLightWhite : colorGrey, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        leading: kHomeController.searchHomeModel.value.data?.data?.isNotEmpty == true
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  height: 40.0,
                                  width: 40.0,
                                  fit: BoxFit.fill,
                                  imageUrl: kHomeController.searchHomeModel.value.data?.data?[index]?.avatarUrl ?? '',
                                  placeholder: (context, url) => Image(image: profilePlaceholder, fit: BoxFit.cover),
                                  errorWidget: (context, url, error) => Image(image: profilePlaceholder, fit: BoxFit.cover),
                                ),
                              )
                            : Center(
                                child: Image.asset(
                                'user',
                                scale: 3.5,
                                height: 40.0,
                                width: 40.0,
                                fit: BoxFit.fill,
                              )));
                  })
              : Center(
                  child: Text(
                  'No History Found..',
                  style: blackInter14W500.copyWith(color: isDarkOn.value == true ? colorLightWhite : colorGrey, fontWeight: FontWeight.w400),
                ));
        }));
  }
}
