import 'package:catalift_app/widgets/mentor_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:catalift_app/utils/apptheme.dart';
import 'package:provider/provider.dart';
import 'package:catalift_app/viewmodels/mentor_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MentorViewModel>(context, listen: false).fetchMentors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.white,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 100.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Image.asset(
            'assets/catalift_image.jpeg',
           
            filterQuality: FilterQuality.high,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Apptheme.primary,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Apptheme.primary,
          showSelectedLabels: true,
          currentIndex: 1,
          unselectedLabelStyle: TextStyle(color: Apptheme.white),
          unselectedItemColor: Apptheme.white.withOpacity(0.6),
          selectedItemColor: Apptheme.white,
          selectedLabelStyle: TextStyle(color: Apptheme.white),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "Explore Mentors"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book), label: "Courses"),
          ]),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Mentors",
                      style: TextStyle(
                          color: Apptheme.primary,
                          fontSize: 22.sp,
                          fontFamily: "Calibri",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const MentorPageSelectButton(),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 35.h,
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                      border: Border.all(
                          color: Colors.lightBlue.withOpacity(0.3),
                          width: 0.5.sp)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 15.sp,
                        color: Colors.blueAccent.withOpacity(0.4),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                          width: 260.w,
                          height: double.maxFinite,
                          child: TextField(
                              onChanged: (value) {
                                Provider.of<MentorViewModel>(context,
                                        listen: false)
                                    .setSearchQuery(value);
                              },
                              style: TextStyle(
                                  color: Colors.lightBlue.withOpacity(0.3),
                                  fontWeight: FontWeight.w300),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: Colors.lightBlue.withOpacity(0.3),
                                      fontWeight: FontWeight.w300),
                                  isDense: false)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Expanded(
                  child: Consumer<MentorViewModel>(
                    builder: (context, viewModel, _) {
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: viewModel.mentors.length,
                        itemBuilder: (context, index) {
                          final mentor = viewModel.mentors[index];
                          return MentorCard(mentor: mentor);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MentorPageSelectButton extends StatefulWidget {
  const MentorPageSelectButton({super.key});

  @override
  State<MentorPageSelectButton> createState() => _MentorPageSelectButtonState();
}

class _MentorPageSelectButtonState extends State<MentorPageSelectButton> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<MentorViewModel>(
      builder: (context, viewModel, _) => Container(
        width: double.maxFinite,
        height: 25.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Apptheme.primary.withOpacity(0.2),
        ),
        child: Row(
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  viewModel.toggleExplore(false);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (viewModel.isExploreSelected)
                        ? Colors.transparent
                        : Apptheme.primary,
                  ),
                  child: Center(
                      child: Text(
                    "My Mentors",
                    style: TextStyle(
                      color: (viewModel.isExploreSelected)
                          ? Apptheme.fontPrimary
                          : Apptheme.fontWhite,
                      fontWeight: (viewModel.isExploreSelected)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    viewModel.toggleExplore(true);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (!viewModel.isExploreSelected)
                        ? Colors.transparent
                        : Apptheme.primary,
                  ),
                  child: Center(
                      child: Text(
                    "Explore",
                    style: TextStyle(
                      color: (!viewModel.isExploreSelected)
                          ? Apptheme.fontPrimary
                          : Apptheme.fontWhite,
                      fontWeight: (!viewModel.isExploreSelected)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
