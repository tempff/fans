import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/constants.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> with TickerProviderStateMixin {
  RxBool isExpansionTileOpen = false.obs;
  TabController? tabController;
  RxInt scrollIndex = 0.obs;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  final List<StaggeredGridTile> _cardTile = <StaggeredGridTile>[
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 3,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 3,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        vsync: this, length: kNotificationController.myPageModel.value.data?.categoryMaster?.length ?? 0, initialIndex: scrollIndex.value);
    kNotificationController.myPageApiCall({}, () {
      kNotificationController.myPageModel.refresh();
      tabController = TabController(
          vsync: this, length: kNotificationController.myPageModel.value.data?.categoryMaster?.length ?? 0, initialIndex: scrollIndex.value);
       kExploreController.creatorsApiCall({}, () {}, 'creators');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        padding: 0.0,
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            18.heightBox,
            Obx(() => kNotificationController.myPageModel.value.data?.categoryMaster?.isNotEmpty == true
                ? TabBar(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 12.0, right: 5.0),
                    indicator: BoxDecoration(color: deepPurpleColor, borderRadius: BorderRadius.circular(25.0)),
                    controller: tabController,
                    isScrollable: true,
                    unselectedLabelColor: isDarkOn.value == true ? colorLightWhite : colorGrey,
                    onTap: (index) {
                      scrollIndex.value = index;
                      if (scrollIndex.value == 0) {
                        kExploreController.creatorsApiCall({}, () {
                          pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                        }, 'creators');
                      } else if (scrollIndex.value == 1) {
                        kExploreController.creatorsApiCall({}, () {
                          pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                        }, 'category/artist');
                      }
                    },
                    indicatorColor: colorPrimary,
                    labelColor: colorWhite,
                    unselectedLabelStyle: blackInter15W500,
                    tabs: [
                        ...?kNotificationController.myPageModel.value.data?.categoryMaster?.map((e) => Tab(
                              text: e.name,
                            ))
                      ])
                : const SizedBox(
                    height: 45.0,
                  )),
            20.heightBox,
            /* Text(
              'Explore our Craters',
              style: FontStyleUtility.blackInter22W700.copyWith(fontSize: 35),
            ),
            Text('The best of content craters are here ',
                style: FontStyleUtility.greyInter16W500),
            40.heightBox,
            StreamBuilder<Object>(
                stream: isExpansionTileOpen.stream,
                builder: (context, snapshot) {
                  return Theme(
                    data: ThemeData()
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      initiallyExpanded: isExpansionTileOpen.value,
                      onExpansionChanged: (val) {
                        isExpansionTileOpen.value = val;
                      },
                      title: Container(
                          width: getScreenWidth(context) - 20,
                          height: 50,
                          decoration: BoxDecoration(
                              color: deepPurpleColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.filter_list,
                                color: colorWhite,
                              ),
                              10.widthBox,
                              Text(
                                'Filter by',
                                style: FontStyleUtility
                                    .blackDMSerifDisplay18W400
                                    .copyWith(color: colorWhite),
                              ),
                            ],
                          )),
                      trailing: null,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: colorGrey.withOpacity(0.2), width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 15),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.filter_list,
                                      color: colorGrey,
                                    ),
                                    10.widthBox,
                                    Text(
                                      'Filter by',
                                      style: FontStyleUtility.greyInter18W500
                                          .copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              10.heightBox,
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.speed),
                                title: const Text('Popular'),
                              ),
                              ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.person_outline),
                                  title: const Text('Featured Creators')),
                              ListTile(
                                  onTap: () {},
                                  leading: const Icon(
                                      Icons.mode_edit_outline_outlined),
                                  title: const Text('More Active')),
                              ListTile(
                                  onTap: () {},
                                  leading: const Icon(
                                      Icons.account_balance_wallet_outlined),
                                  title: const Text('New creators')),
                              ListTile(
                                  onTap: () {},
                                  leading:
                                      const Icon(Icons.verified_outlined),
                                  title: const Text('Free Subscriptions')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            10.heightBox,
            StreamBuilder<Object>(
                stream: isExpansionTileOpen.stream,
                builder: (context, snapshot) {
                  return Theme(
                    data: ThemeData()
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      initiallyExpanded: isExpansionTileOpen.value,
                      onExpansionChanged: (val) {
                        isExpansionTileOpen.value = val;
                      },
                      title: Container(
                          width: getScreenWidth(context) - 20,
                          height: 50,
                          decoration: BoxDecoration(
                              color: deepPurpleColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.menu,
                                color: colorWhite,
                              ),
                              10.widthBox,
                              Text(
                                'Categories',
                                style: FontStyleUtility
                                    .blackDMSerifDisplay18W400
                                    .copyWith(color: colorWhite),
                              ),
                            ],
                          )),
                      trailing: null,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: colorGrey.withOpacity(0.2), width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 15),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.menu,
                                      color: colorGrey,
                                    ),
                                    10.widthBox,
                                    Text(
                                      'Categories',
                                      style: FontStyleUtility.greyInter18W500
                                          .copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              10.heightBox,
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.speed),
                                title: const Text('Animation'),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.person_outline),
                                title: const Text('Artist'),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                    Icons.mode_edit_outline_outlined),
                                title: const Text('Designer'),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                    Icons.account_balance_wallet_outlined),
                                title: const Text('Developer'),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.verified_outlined),
                                title: const Text('Others'),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.verified_outlined),
                                title: const Text('Photography'),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.verified_outlined),
                                title: const Text('Products'),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.verified_outlined),
                                title: const Text('Video and Film'),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.verified_outlined),
                                title: const Text('Writing'),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            30.heightBox,
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.no_accounts_rounded,
                    color: colorGrey,
                    size: 180,
                  ),
                  Text('No result have been found',
                      style: FontStyleUtility.greyInter18W500),
                ],
              ),
            ),*/

            Expanded(
              child: StreamBuilder<Object>(
                  stream: scrollIndex.stream,
                  builder: (context, snapshot) {
                    return PageView.builder(
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (index) {
                        scrollIndex.value = index;
                        if (scrollIndex.value == 0) {
                          kExploreController.creatorsApiCall({}, () {}, 'creators');
                        } else if (scrollIndex.value == 1) {
                          kExploreController.creatorsApiCall({}, () {}, 'category/artist');
                        }
                        tabController?.animateTo(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      controller: pageController,
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return RawScrollbar(
                          thickness: 5.0,
                          thumbColor: colorSplash.withOpacity(0.5),
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Obx(() {
                              return scrollIndex.value == 1 || scrollIndex.value == 0
                                  ? StaggeredGrid.count(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      children: [
                                        ...?kExploreController.creatorsModel.value.data?.users?.data?.map(
                                          (e) => StaggeredGridTile.count(
                                            crossAxisCellCount: 2,
                                            mainAxisCellCount: 2,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(18.0),
                                                child: Stack(
                                                  fit: StackFit.expand,
                                                  children: [
                                                    Image.network(e?.avatarUrl ?? ''),
                                                    Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: Container(
                                                        margin: const EdgeInsets.only(right: 10, bottom: 10),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(100),
                                                          color: colorDarkBlack.withOpacity(0.5),
                                                        ),
                                                        height: 30,
                                                        width: 30,
                                                        child: Center(
                                                          child: Text(
                                                            '55',
                                                            style: FontStyleUtility.whiteInter14W500,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        )
                                      ],
                                    )
                                  : SizedBox(
                                      height: getScreenHeight(context) * 0.6,
                                      child: Center(
                                        child: Text(
                                          'Data is not available...',
                                          style: blackInter14W500.copyWith(
                                              color: isDarkOn.value == true ? colorWhite : colorGrey, fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    );
                            }),
                          ),
                        );
                      },
                    );
                  }),
            ),
            /* 20.heightBox*/
          ],
        ));
  }
}
