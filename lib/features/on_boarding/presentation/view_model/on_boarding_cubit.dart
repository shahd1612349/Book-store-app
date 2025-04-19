import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      image: 'assets/images/Frame_1.svg',
      titleKey: 'Now reading books will be easier',
      descriptionKey:
          ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
    ),
    OnBoardingModel(
      image: 'assets/images/Frame_2.svg',
      titleKey: ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
      descriptionKey: ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
    ),
    OnBoardingModel(
        image: 'assets/images/Frame_3.svg',
        titleKey: 'Start Your Adventure',
      descriptionKey: "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",

    ),

  ];

  void changePage(int index) {
    emit(index);
  }
}
