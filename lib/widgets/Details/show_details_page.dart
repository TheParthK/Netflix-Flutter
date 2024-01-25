import 'package:flutter/material.dart';
import '../../services/services.dart';
import 'details_page.dart';

class ShowDetailsPage{
  static showDetails(PosterModal posterModal, EdgeInsets devicePadding, Size size, BuildContext context){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black45,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DetailsPage(posterModal: posterModal, topPadding: devicePadding.top,);
      },);
  }
}