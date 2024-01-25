import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox( 
        height: devicePadding.top + 15 + 35,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: devicePadding.top,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      tileMode: TileMode.clamp,
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    colors:  [Colors.black,Colors.black, Colors.black.withAlpha(220), Colors.black.withAlpha(150), Colors.black.withAlpha(50), Colors.transparent]
                    // colors:  [Colors.black,Colors.black.withAlpha(100), Colors.transparent]
                  )
                  ),
                )
              ],
            ),
            Container(
                padding: EdgeInsets.only(left: 12, right: 12, top: devicePadding.top + 5, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2015_N_logo.svg/1128px-Netflix_2015_N_logo.svg.png'
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.cast,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12,),
                    Container(
                      width: 27,
                      height: 27,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://i.pinimg.com/564x/b2/a0/29/b2a029a6c2757e9d3a09265e3d07d49d.jpg'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(3))
                      ),
                    )
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}