import 'package:flutter/cupertino.dart';
import '../../services/services.dart';
import 'home_list.dart';

class FutureListBuilder extends StatelessWidget {
  final String title;
  final String searchTerm;
  const FutureListBuilder({super.key, required this.title, required this.searchTerm});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIservice.getTV(searchTerm),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return HomeListWidget(snapshot: snapshot, title: title);
        } else {
          return const SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(child: CupertinoActivityIndicator())
            );
        }
      },
    );
  }
}
