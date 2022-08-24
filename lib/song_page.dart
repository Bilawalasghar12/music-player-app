import 'package:flutter/material.dart';
import 'package:musicplayerapp/neu_box.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';



class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
List<LibraryModelView> newList = [
  LibraryModelView(
    "images.jpg","The Weeknd"," 'Starboy'"
  ),
  LibraryModelView(
      "assets/cover_art.png","kendrick lemar"," 'Birdie'"
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 10),

                // back button and menu button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: NeuBox(child:Icon(Icons.arrow_back) )),

                    Text('P L A Y L I S T'),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: NeuBox(child: Icon(Icons.menu)),
                    ),
                  ],
                ),

                 const SizedBox(height: 25),

                CarouselSlider.builder(
                  itemCount:newList.length ,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                      NeuBox(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(newList[itemIndex]._image.toString(),height:300, width:300, fit: BoxFit.fill,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0, right:8, bottom:8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newList[itemIndex]._h1.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                       Text(
                                        newList[itemIndex]._h2.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 32,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  , options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,

                  viewportFraction: 0.9,
                  aspectRatio: 0.9,
                  initialPage: 1,
                ),
                ),  // cover art, artist name, song name


                const SizedBox(height: 30),

                // start time, shuffle button, repeat button, end time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('0:00'),
                    Icon(Icons.shuffle),
                    Icon(Icons.repeat),
                    Text('4:22')
                  ],
                ),

                const SizedBox(height: 30),

                // linear bar
                NeuBox(
                  child: LinearPercentIndicator(
                    lineHeight: 10,
                    percent: 0.8,
                    progressColor: Colors.green,
                    backgroundColor: Colors.transparent,

                  ),
                ),

                const SizedBox(height: 30),

                // previous song, pause play, skip next song
                SizedBox(
                  height: 80,
                  child: Row(
                    children: const [
                      Expanded(
                        child: NeuBox(
                            child: Icon(
                              Icons.skip_previous,
                              size: 32,
                            )),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: NeuBox(
                              child: Icon(
                                Icons.arrow_forward,
                                size: 32,
                              )),
                        ),
                      ),
                      Expanded(
                        child: NeuBox(
                            child: Icon(
                              Icons.skip_next,
                              size: 32,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

class LibraryModelView{
  String? _image ;
  String? _h1;
  String? _h2;

  LibraryModelView(String? image, String? h1, String? h2){
    _image = image;
    _h2 = h2;
    _h1 = h1;
  }
}