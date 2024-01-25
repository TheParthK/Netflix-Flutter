import 'package:flutter/material.dart';
import 'package:netflix/services/services.dart';
import 'package:netflix/widgets/Common/made_by_me.dart';
import 'package:netflix/widgets/Home/big_poster_options_bar.dart';
import 'package:netflix/widgets/Home/big_poster_trailer_common.dart';
import 'package:video_player/video_player.dart';
import '../widgets/Home/future_list_builder.dart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<HomeListModal> listHomeModals = [
    HomeListModal(title: 'Start Exploring', searchTerm: ''),
    HomeListModal(title: 'Hey Peter Parker!', searchTerm: 'Spider-Man'),
    HomeListModal(title: 'The Ben 10 Universe', searchTerm: 'Ben 10'),
    HomeListModal(title: 'From Marvel Studios', searchTerm: 'Marvel Studios'),
    HomeListModal(title: 'The Harry Potter Series', searchTerm: 'Harry Potter'),
    HomeListModal(title: 'The Terminator Saga', searchTerm: 'Terminator'),
  ];

  late VideoPlayerController _videoPlayerController;
  bool isPlaying = false;
  @override
  void initState() {
    initialiseVideoPlayer();
    super.initState();
  }

  void initialiseVideoPlayer(){
    _videoPlayerController = VideoPlayerController.asset('assets/videos/eeaao_trailer.mp4')
    ..initialize().then((value){setState(() {});})
    ..setLooping(false)
    ..pause();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void playPause(){
    if(isPlaying){
      setState(() {
        isPlaying = false;
      });
      _videoPlayerController.pause();
      _videoPlayerController.seekTo(Duration.zero);
    } else {
      setState(() {
        isPlaying = true;
      });
      _videoPlayerController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height:devicePadding.top + 12,), 
          TrailerAndBigPoster(isPlaying: isPlaying, videoPlayerController: _videoPlayerController),
          BigPosterOptionsBar(isPlaying: isPlaying, playPause: playPause),
          ...listHomeModals.map((homeModalList) => FutureListBuilder(title: homeModalList.title, searchTerm: homeModalList.searchTerm)),
          const SizedBox(height: 100,),
          const MadeByMe()
        ],
      ),
    );
  }
}
