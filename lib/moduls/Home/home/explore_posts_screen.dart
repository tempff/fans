import 'package:fans/moduls/Home/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utility/utility_export.dart';

class ExplorePostsScreen extends StatefulWidget {
  const ExplorePostsScreen({Key? key}) : super(key: key);

  @override
  State<ExplorePostsScreen> createState() => _ExplorePostsScreenState();
}

class _ExplorePostsScreenState extends State<ExplorePostsScreen> {
  String foos = 'One';
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              commonTextField(
                  hintText: 'Search',
                  textEditingController: null,
                  borderOpacity: 0.2,
                  preFixWidget: const Icon(Icons.search)),
              8.heightBox,
              Theme(
                data: ThemeData(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.centerLeft,
                  title: Container(
                      height: 50.0,
                      padding: const EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                          color: colorWhite,
                          border:
                              Border.all(color: colorBlack.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Latest'),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          ))),
                  trailing: null,
                  children: [
                    ListTile(
                        title: Text(
                      'Latest',
                      style: FontStyleUtility.blackInter14W500,
                    )),
                    ListTile(
                        title: Text(
                      'Old',
                      style: FontStyleUtility.blackInter14W500,
                    )),
                    ListTile(
                        title: Text(
                      'Un lockable',
                      style: FontStyleUtility.blackInter14W500,
                    )),
                    ListTile(
                        title: Text(
                      'Free',
                      style: FontStyleUtility.blackInter14W500,
                    )),
                  ],
                ),
              ),
              30.heightBox,
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(35),
                                // Image radius
                                child: Image.asset(
                                  'assets/images/profile.jpeg',
                                  scale: 3.5,
                                  height: 55.0,
                                  width: 55.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            20.widthBox,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Admin',
                                      style: FontStyleUtility.blackInter22W500
                                          .copyWith(
                                              color: deepPurpleColor,
                                              fontWeight: FontWeight.w900),
                                    ),
                                    5.widthBox,
                                    const Icon(
                                      Icons.verified,
                                      color: blueColor,
                                    ),
                                    5.widthBox,
                                    Text(
                                      '@Admin',
                                      style: FontStyleUtility.greyInter14W500,
                                    )
                                  ],
                                ),
                                5.heightBox,
                                Row(
                                  children: [
                                    Text(
                                      '5 day to ago',
                                      style: FontStyleUtility.greyInter16W500,
                                    ),
                                    10.widthBox,
                                    const Icon(
                                      Icons.lock_outline,
                                      color: colorGrey,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            PopupMenuButton(
                              icon: const Icon(
                                Icons.more_horiz,
                                size: 35,
                                color: colorGrey,
                              ),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Row(
                                      children: [
                                        const Icon(Icons.ios_share_outlined),
                                        10.widthBox,
                                        const Text('Go to post'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(
                                      children: [
                                        const Icon(CupertinoIcons.pin),
                                        10.widthBox,
                                        const Text('Pin your Profile'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(
                                      children: [
                                        const Icon(CupertinoIcons.link),
                                        10.widthBox,
                                        const Text('Copy link'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(
                                      children: [
                                        const Icon(Icons.edit_outlined),
                                        10.widthBox,
                                        const Text('Edit post'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(
                                      children: [
                                        const Icon(Icons.delete_outline),
                                        10.widthBox,
                                        const Text('Delete post'),
                                      ],
                                    ),
                                  ),
                                ];
                              },
                              onSelected: (String value) =>
                                  actionPopUpItemSelected(
                                value,
                                'name',
                                context,
                                kHomeController
                                    .myPostModel.value.posts?[index].id,
                                kHomeController.myPostModel.value.posts?[index]
                                    .description,
                                kHomeController
                                    .myPostModel.value.posts?[index ?? 0].image,
                              ),
                            ),
                          ],
                        ),
                        15.heightBox,
                        Text(
                          'Testing',
                          style: greyInter16W500,
                        ),
                        10.heightBox,
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/profile.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        5.heightBox,
                        Row(
                          children: [
                            StreamBuilder<Object>(
                                stream: kHomeController.likeButton.stream,
                                builder: (context, snapshot) {
                                  return IconButton(
                                      splashColor: colorRed,
                                      splashRadius: 20.0,
                                      onPressed: () {
                                        kHomeController.likeButton.value =
                                            !kHomeController.likeButton.value;
                                      },
                                      icon: Icon(
                                        kHomeController.likeButton.value == true
                                            ? CupertinoIcons.heart_fill
                                            : CupertinoIcons.suit_heart,
                                        size: 25,
                                        color:
                                            kHomeController.likeButton.value ==
                                                    true
                                                ? colorRed
                                                : colorGrey,
                                      ));
                                }),
                            Text(
                              '1',
                              overflow: TextOverflow.ellipsis,
                              style: FontStyleUtility.greyInter18W500,
                            ),
                            2.widthBox,
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.chat_bubble,
                                  size: 22,
                                  color: colorGrey,
                                )),
                            Text(
                              '1',
                              overflow: TextOverflow.ellipsis,
                              style: FontStyleUtility.greyInter18W500,
                            ),
                            2.widthBox,
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.share,
                                  size: 22,
                                  color: colorGrey,
                                )),
                            const Spacer(),
                            StreamBuilder<Object>(
                                stream: kHomeController.bookmarkButton.stream,
                                builder: (context, snapshot) {
                                  return IconButton(
                                      splashColor: deepPurpleColor,
                                      splashRadius: 20.0,
                                      onPressed: () {
                                        kHomeController.bookmarkButton.value =
                                            !kHomeController
                                                .bookmarkButton.value;
                                      },
                                      icon: Icon(
                                        kHomeController.bookmarkButton.value ==
                                                true
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                        size: 23,
                                        color: kHomeController
                                                    .bookmarkButton.value ==
                                                true
                                            ? deepPurpleColor
                                            : colorGrey,
                                      ));
                                })
                          ],
                        )
                      ],
                    );
                  })
            ],
          ),
        ));
  }
}
