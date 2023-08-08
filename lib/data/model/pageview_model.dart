import 'package:design/utils/app_constants.dart';
import 'package:design/utils/images.dart';

class PageViewModel {
  final String title;
  final String subtitle;
  final String img;
  PageViewModel({
    required this.img,
    required this.subtitle,
    required this.title,
  });
  static List<PageViewModel> pageViewList = [
    PageViewModel(
        img: Images.chief,
        title: AppConstants.introTitleOne,
        subtitle: AppConstants.introSubtitleOne),
    PageViewModel(
        img: Images.delivery,
        title: AppConstants.introTitleSecond,
        subtitle: AppConstants.introSubtilteSecond),
    PageViewModel(
        img: Images.schedule,
        title: AppConstants.introTitleThird,
        subtitle: AppConstants.introSubtilteThird),
  ];
}
