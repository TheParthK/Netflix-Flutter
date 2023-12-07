import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:netflix/services/services.dart';

class DetailsPage extends StatelessWidget {
  final double topPadding;
  final PosterModal posterModal;
  const DetailsPage({super.key, required this.posterModal, required this.topPadding});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: FractionallySizedBox(
        heightFactor: 1,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 20, 20, 20),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15))
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: size.width,
                        height: 1.5 * size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(posterModal.image),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: 1.5 * size.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter, end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.transparent, Colors.transparent, Colors.transparent, Color.fromARGB(255, 20, 20, 20)]
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.5 * size.width - 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 12,
                                  child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2015_N_logo.svg/1128px-Netflix_2015_N_logo.svg.png')
                                ),
                                const SizedBox(width: 5,),
                                Text(
                                  posterModal.langauge.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white.withAlpha(150),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                  ),
                                ),
                                // Icon(Icons.star_rounded, color: Colors.white.withAlpha(150),size: 15,)
                              ],
                            ),
                            Text(
                              posterModal.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              posterModal.yearStarted.substring(0, 4),
                              style: TextStyle(
                                color: Colors.white.withAlpha(150),
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              '${posterModal.avgRuntime} MINS',
                              style: TextStyle(
                                color: Colors.white.withAlpha(150),
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                SizedBox(
                                  height: 12,
                                  child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/IMDB_Logo_2016.svg/2560px-IMDB_Logo_2016.svg.png'),
                                  ),
                                  const SizedBox(width: 5,),
                                  Text(
                                  '${posterModal.rating}/10',
                                  style: TextStyle(
                                    color: Colors.white.withAlpha(150),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                  ),
                                ),
                                // const SizedBox(height: 5,),
                                // Icon(Icons.star_rounded, color: Colors.white.withAlpha(150),size: 12,)
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                ...posterModal.genres
                                  .map((e) => 
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Text(
                                      e.toString().toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white.withAlpha(150),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                      ),
                                    ),
                                  )
                                )
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Html(
                              data: posterModal.summary,
                              shrinkWrap: true,
                              style: {
                                '*' : Style(
                                  color: const Color.fromARGB(255, 222, 222, 222),
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.zero
                                )
                              },
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide(width: 4, color: Color.fromARGB(255, 229, 9, 20)))
                                  ),
                                  child: Text(
                                    'More Info',
                                    style: TextStyle(
                                      color: Colors.white.withAlpha(255),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(width: 4, color: Colors.white.withAlpha(150)))
                                  ),
                                  child: Text(
                                    'Visit',
                                    style: TextStyle(
                                      color: Colors.white.withAlpha(255),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 200,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    colors: [Colors.black, Color.fromARGB(180, 0, 0, 0), Colors.transparent]
                  )
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, right: 7),
                    child: Material(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: InkWell(
                        onTap: Navigator.of(context).pop,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: Ink(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color:  Color.fromARGB(255, 20, 20, 20),
                            gradient:  RadialGradient(
                              center: Alignment.center,
                              colors: [Colors.black, Color.fromARGB(255, 20, 20, 20)]
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}