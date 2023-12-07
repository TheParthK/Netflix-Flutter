import 'package:flutter/material.dart';
import '../../services/services.dart';
import '../Details/show_details_page.dart';

class CommonPosterWidget extends StatefulWidget {
  final PosterModal posterModal;
  const CommonPosterWidget({super.key, required this.posterModal});

  @override
  State<CommonPosterWidget> createState() => _CommonPosterWidgetState();
}

class _CommonPosterWidgetState extends State<CommonPosterWidget> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: (e) {
        setState(() {
          opacity = 0.2;
        });
      },
      onTapUp: (e) {
        setState(() {
          opacity = 1;
        });
      },
      onTapCancel: () {
        setState(() {
          opacity = 1;
        });
      },
      onTap: () => ShowDetailsPage.showDetails(widget.posterModal, devicePadding, size, context),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        curve: Curves.fastOutSlowIn,
        opacity: opacity,
        child: Container(
          width: 150,
          height: 1.5 * 150,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 35, 35, 35),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(image: NetworkImage(widget.posterModal.image), fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}