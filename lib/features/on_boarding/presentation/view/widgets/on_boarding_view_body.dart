import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../view_model/on_boarding_cubit.dart';

class OnBoardViewBody extends StatefulWidget {
  const OnBoardViewBody({super.key});

  @override
  State<OnBoardViewBody> createState() => _OnBoardViewBodyState();
}

class _OnBoardViewBodyState extends State<OnBoardViewBody> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocBuilder<OnBoardingCubit, int>(
        builder: (context, state) {
          var cubit = OnBoardingCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                // Skip button
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.05,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xff54408C),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) => cubit.changePage(index),
                    itemCount: cubit.pages.length,
                    itemBuilder: (context, index) {
                      final page = cubit.pages[index];

                      return Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.55,
                            child: SvgPicture.asset(
                              page.image,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.1),
                            child: Column(
                              children: [
                                Text(
                                  page.titleKey,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                Text(
                                  page.descriptionKey,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.034,
                                    color: Colors.black54,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                SmoothPageIndicator(
                  controller: pageController,
                  count: cubit.pages.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: const Color(0xff54408C),
                    dotColor: Colors.grey,
                    dotHeight: screenWidth * 0.015,
                    dotWidth: screenWidth * 0.015,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.04,
                    horizontal: screenWidth * 0.1,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (state == cubit.pages.length - 1) {
                        Navigator.pushNamed(context, '/');
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: state == cubit.pages.length - 1
                          ? const Color(0xff54408C)
                          : Colors.white,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      elevation: 4,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Text(
                      state == cubit.pages.length - 1
                          ? 'Get Started'
                          : 'Continue',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: state == cubit.pages.length - 1
                            ? Colors.white
                            : const Color(0xff54408C),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
