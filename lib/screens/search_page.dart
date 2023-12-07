import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/services/services.dart';
import '../widgets/Common/back_30x45_button.dart';
import '../widgets/Common/list_title.dart';
import '../widgets/Common/common_poster_widget.dart';
import '../widgets/Search/search_field_widget.dart';

class SearchPage extends StatefulWidget {
  final VoidCallback backFunction;
  const SearchPage({super.key, required this.backFunction});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textEditingController = TextEditingController();

  String searchTerm = 'sau';

  void changedSearchTerm(){
    setState(() {
      searchTerm = _textEditingController.text.trim();
    });
  }
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Column(
          // padding: EdgeInsets.zero,
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: devicePadding.top + 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Back30x45Button(backFunction: widget.backFunction),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(90),
                        borderRadius: const BorderRadius.all(Radius.circular(7))
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.search, color: Colors.grey.withAlpha(150),),
                          const SizedBox(width: 10,),
                          SearchFieldWidget(textEditingController: _textEditingController, searchFunction: changedSearchTerm,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView(
                // shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.zero,
                children: [
                  const ListTitle(title: 'Movies & TV',),
                  FutureBuilder(
                    future: APIservice.getTV(searchTerm),
                    builder: (context, snapshot) {
                      return 
                      snapshot.hasData && snapshot.data!.length > 1? 
                      GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          // crossAxisSpacing: 6,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2.2/3,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          ...snapshot.data!.map((posterModal) => CommonPosterWidget(posterModal: posterModal))
                        ],
                      ) :
                      Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CupertinoActivityIndicator(color: Colors.white,),
                            SizedBox(height: 20,),
                          ],
                        ));
                    }
                  ),
                  SizedBox(height: devicePadding.bottom + 50,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

