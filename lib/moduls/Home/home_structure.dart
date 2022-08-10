import 'package:fans/moduls/Home/home/my_posts_screen.dart';
import 'package:fans/moduls/Home/notification/View/billing_screen.dart';
import 'package:fans/moduls/Home/notification/View/dashboard_screen.dart';
import 'package:fans/moduls/Home/notification/View/my_page_screen.dart';
import 'package:fans/moduls/Home/notification/View/mysubscribers_screen.dart';
import 'package:fans/moduls/Home/notification/View/mysubscriptions_screen.dart';
import 'package:fans/moduls/Home/notification/View/social_profile_screen.dart';
import 'package:fans/moduls/Home/notification/View/wallet_screen.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../LoginFlow/views/signin_screen.dart';
import '../LoginFlow/views/verify_account_screen.dart';
import 'chat/chat_screen.dart';
import 'explore/explore_screen.dart';
import 'home/bookmark_screen.dart';
import 'home/home_screen.dart';
import 'notification/notification_screen.dart';

class HomeStructureView extends StatefulWidget {
  const HomeStructureView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeStructureViewState createState() => _HomeStructureViewState();
}

RxInt tabSelectedIndex = 0.obs;

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomeStructureViewState extends State<HomeStructureView> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    ChatScreen(),
    NotificationScreen(),
    MyPageScreen()
  ];

  @override
  void initState() {
    setIsLogin(isLogin: true);
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      tabSelectedIndex.value = index;
    });
  }

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: commonAppBar(
            height: tabSelectedIndex.value == 0 || tabSelectedIndex.value == 1
                ? 80.0
                : 70.0,
            // appbarBgColor: isDarkOn.value == true ? colorBlack : colorWhite,
            leadingIcon: Container(
              margin: const EdgeInsets.only(top: 15.0),
              child: IconButton(
                icon: Center(
                  child: Icon(
                    Icons.menu_outlined,
                    color: isDarkOn.value == true ? colorWhite : colorBlack,
                  ),
                ),
                onPressed: () {
                  _key.currentState?.openDrawer();
                  disableFocusScopeNode(context);
                },
              ),
            ),
            titleWidget:
                tabSelectedIndex.value == 0 || tabSelectedIndex.value == 1
                    ? Container(
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
                            preFixWidget: const Icon(
                              Icons.search,
                              color: colorWhite,
                            )),
                      )
                    : const SizedBox(),
            actionWidgets: [
              tabSelectedIndex.value == 0
                  ? Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: IconButton(
                          padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                          onPressed: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20))),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          height: 5,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: colorGrey,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                        ),
                                        ListTile(
                                            title: Text(
                                          'Latest',
                                          style: blackInter18W500,
                                        )),
                                        ListTile(
                                            title: Text(
                                          'Old',
                                          style: blackInter18W500,
                                        )),
                                        ListTile(
                                            title: Text(
                                          'Unlockable',
                                          style: blackInter18W500,
                                        )),
                                        ListTile(
                                            title: Text(
                                          'Free',
                                          style: blackInter18W500,
                                        )),
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Image.asset(
                            'assets/appIcons/filter.png',
                            color: isDarkOn.value == true
                                ? colorWhite
                                : colorBlack,
                            height: 25,
                            width: 25,
                            scale: 3.5,
                          )),
                    )
                  : const SizedBox(
                      width: 10.0,
                    ),
            ]),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      _key.currentState?.closeDrawer();
                    },
                    icon: const Icon(Icons.close)),
              ),
              // ListTile(
              //   leading:
              //       Image.asset('assets/appIcons/myprofile.png', scale: 4.5),
              //   title: Text(
              //     'My Page',
              //     style: FontStyleUtility.blackSansSerif18W500,
              //   ),
              //   onTap: () {
              //     Get.back();
              //     setState((){
              //     tabSelectedIndex.value = 4;
              //     tabSelectedIndex.refresh();
              //     });
              //
              //   },
              // ),
              ListTile(
                leading: const Icon(
                  Icons.dashboard,
                  size: 30,
                ),
                title: Text(
                  'Dashboard',
                  style: blackInter16W500,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const DashboardScreen());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.grid_on,
                  size: 30,
                ),
                title: Text(
                  'My Post',
                  style: blackInter16W500,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const MyPostsScreen());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.bookmark,
                  size: 30,
                ),
                title: Text(
                  'Bookmarks',
                  style: blackInter16W500,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const BookMarkScreen());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.savings,
                  size: 30,
                ),
                title: Text(
                  'Balance: TZS12,432.0',
                  style: blackInter16W500,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_balance_wallet,
                  size: 30,
                ),
                title: Text(
                  'Wallet: TZS12,432.0',
                  style: blackInter16W500,
                ),
                onTap: () {
                  Get.to(() => const WalletScreen());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.group,
                  size: 30,
                ),
                title: Text(
                  'My Subscribers',
                  style: blackInter16W500,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const MySubscribersScreen());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.workspace_premium,
                  size: 30,
                ),
                title: Text(
                  'My Subscriptions',
                  style: blackInter16W500,
                ),
                onTap: () {
                  Get.to(() => const MySubscriptionsScreen());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.interests,
                  size: 30,
                ),
                title: Text(
                  'Social Profiles',
                  style: blackInter16W500,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const SocialProfileScreen());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.monetization_on,
                  size: 30,
                ),
                title: Text(
                  'Billing',
                  style: blackInter16W500,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const BillingScreen());
                },
              ),
              StreamBuilder<Object>(
                  stream: isDarkOn.stream,
                  builder: (context, snapshot) {
                    return ListTile(
                      leading: Icon(isDarkOn.value == true
                          ? Icons.sunny
                          : Icons.nights_stay_rounded),
                      title: Text(
                        isDarkOn.value == true ? 'Light Mode' : 'Dark Mode',
                        style: blackInter16W500,
                      ),
                      trailing: const ChangeThemeButtonWidget(),
                    );
                  }),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  size: 30,
                ),
                title: Text(
                  'Log Out',
                  style: blackInter16W500,
                ),
                onTap: () {
                  setIsLogin(isLogin: false);
                  Get.offAll(() => const SignInScreen());
                },
              ),
              20.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: materialButton(
                  onTap: () {
                    Get.back();
                    Get.to(() => const VerifyAccountScreen());
                  },
                  text: 'Be a Creator!',
                  textStyle: blackInter16W500.copyWith(color: colorWhite),
                ),
              )
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(tabSelectedIndex.value),
        ),
        bottomNavigationBar: BottomNavigationBar(
          /*backgroundColor: colorWhite,*/
          unselectedItemColor: isDarkOn.value == true ? colorWhite : colorGrey,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.send,
                size: 30,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: tabSelectedIndex.value,
          selectedItemColor: colorPrimary,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
