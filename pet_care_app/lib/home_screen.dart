import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;

          Get.snackbar("omg", "뒤로가기 두번누르면 종료");
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          toolbarHeight: 60.h,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon/ic-location.png",
                height: 24.h,
              ),
              Text.rich(
                TextSpan(
                    text: "New York, ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, color: Colors.black),
                    children: [
                      TextSpan(
                        text: "US",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    ]),
              )
            ],
          ),
          actions: [
            Container(
              height: 48.h,
              width: 48.h,
              padding: EdgeInsets.all(4.w),
              color: Colors.white,
              child: Image.asset(
                "assets/profile-user.png",
                height: 24.h,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 500),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (BuildContext context, double _val, Widget? child) =>
                  Opacity(
                opacity: _val,
                child: Padding(
                  padding: EdgeInsets.only(top: _val * 20),
                  child: child,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Hi ",
                      style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                      ),
                      children: [
                        TextSpan(
                          text: "Jennifer,\n",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: "Let's take care of your cutie pets!",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      QuickButton(
                          title: "Health",
                          color: Colors.deepPurple[100],
                          imgPath: "assets/icon/ic-health.png"),
                      QuickButton(
                          title: "Nutrition",
                          color: Colors.indigo[200],
                          imgPath: "assets/icon/ic-nutrition.png"),
                      QuickButton(
                          title: "Toy",
                          color: Colors.pink[100],
                          imgPath: "assets/icon/ic-toy.png"),
                      QuickButton(
                          title: "Settings",
                          color: Colors.amber[200],
                          imgPath: "assets/icon/ic-settings.png"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuickButton extends StatelessWidget {
  const QuickButton({
    Key? key,
    required this.title,
    required this.color,
    required this.imgPath,
  }) : super(key: key);
  final String title;
  final Color? color;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48.h,
          width: 48.h,
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: color!.withOpacity(0.4),
                offset: Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
          ),
          child: Image.asset(
            imgPath,
            height: 32.h,
          ),
        ),
        SizedBox(height: 8.h),
        Text(title),
      ],
    );
  }
}
