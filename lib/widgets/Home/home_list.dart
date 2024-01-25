import 'package:flutter/material.dart';
import '../../services/services.dart';
import '../Common/list_title.dart';
import '../Common/common_poster_widget.dart';


class HomeListWidget extends StatelessWidget {
  final AsyncSnapshot<List<PosterModal>> snapshot;
  final String title;
  const HomeListWidget({super.key, required this.snapshot, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTitle(title: title,),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              ...snapshot.data!.map((posterModal) => CommonPosterWidget(posterModal: posterModal))
            ],
          ),
        ),
        const SizedBox(height: 5,)
      ],
    );
  }
}

