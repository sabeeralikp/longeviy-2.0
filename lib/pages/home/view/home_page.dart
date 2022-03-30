import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:longeviy/config/themes/colors.dart';
import 'package:longeviy/config/themes/icon_theme.dart';
import 'package:longeviy/config/themes/margin_padding_gap.dart';
import 'package:longeviy/pages/timeline/timeline.dart';
import 'package:longeviy/pages/profile/profile.dart';
import 'package:longeviy/providers/nav_bar_state_provider.dart';
import 'package:longeviy/providers/recommendation_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/nav_buttons.dart';
import '../widgets/scroll_to_hide_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final user = FirebaseAuth.instance.currentUser!;
  int selectedIndex = 0;
  int badge = 0;
  late ScrollController scrollController;
  PageController pageController = PageController();
  bool isBackgroundImageError = false;

  getPage(ScrollController scrollController, int index) {
    List<Widget> pages = [
      Timeline(scrollController: scrollController),
      const Scaffold(
        body: Center(
          child: Text('Page 2'),
        ),
      ),
      const Scaffold(
        body: Center(
          child: Text('Page 3'),
        ),
      ),
      ProfilePage()
    ];
    return pages[index];
  }

  onImageError() {
    setState(() {
      isBackgroundImageError = true;
    });
  }

  GButton navButton(
    int selectedIndex,
    int index,
  ) {
    return GButton(
      gap: navButtonGap,
      iconActiveColor: primaryColor,
      iconColor: unSelectedWidgetColor,
      textColor: primaryColor,
      backgroundColor: primaryColor.withOpacity(.2),
      iconSize: 20,
      padding: navButtonPadding,
      icon: navButtonSelectedIcons[index],
      text: navButtonTitles[index],
      leading: index == 3
          ? CircleAvatar(
              radius: 12,
              backgroundImage: isBackgroundImageError
                  ? logoAsset as ImageProvider
                  : NetworkImage(user.photoURL!),
              onBackgroundImageError: (object, stackTrace) {
                onImageError();
              },
            )
          : selectedIndex == index
              ? null
              : Icon(
                  navButtonUnSelectedIcons[index],
                  color: unSelectedWidgetColor,
                ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          RecommendationProvider(title: 'How Much Exercise Should You Do?'),
      child: Scaffold(
        extendBody: true,
        body: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
            });
            Provider.of<NavBarStateProvider>(context, listen: false)
                .setNavState(true);
          },
          controller: pageController,
          itemBuilder: (context, position) {
            return getPage(scrollController, position);
          },
          itemCount: 4,
        ),
        bottomNavigationBar: ScrollToHideWidget(
          scrollController: scrollController,
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(.4),
                    offset: const Offset(0, 25),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: GNav(
                  tabs: [
                    navButton(selectedIndex, 0),
                    navButton(selectedIndex, 1),
                    navButton(selectedIndex, 2),
                    navButton(selectedIndex, 3),
                  ],
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                    pageController.jumpToPage(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
