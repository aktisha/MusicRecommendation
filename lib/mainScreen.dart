import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ScrollController ctrl = ScrollController();

    List<Widget> _listOfSongs() {
      List<Widget> songs = [];
      for (int i = 0; i < 10; i++) {
        Widget song = Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://audiotheme.com/content/uploads/duotone-effect.jpg'),
                  radius: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Song no. ' + (i + 1).toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Artist Name | Album Name',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.14,
                ),
                Icon(Icons.menu)
              ],
            ));
        songs.add(song);
      }
      return songs;
    }

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: height * 0.6,
                      child: Stack(
                        children: <Widget>[
                          ClipRect(
                            child: Container(
                              height: height * 0.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cgfrog.com/wp-content/uploads/2017/08/CGfrog-Duotone-Efx2.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: new BackdropFilter(
                                filter: new ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: new Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.black26.withOpacity(0)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            constraints:
                                BoxConstraints.expand(height: height * 0.5),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.transparent, Colors.black],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                          Positioned(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios,
                              ),
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: height * 0.075,
                            left: width * 0.2,
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 100,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://cdn.shopify.com/s/files/1/0178/0792/products/SMOKE_MIRRORS_3_CoverArt_1024x1024.jpg'),
                                radius: 90,
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.38,
                            left: width * 0.28,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Heavy Addiction',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                Text(
                                  '16 songs | 68 mins',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: height * 0.47,
                            left: width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MaterialButton(
                                    onPressed: () {},
                                    elevation: 5,
                                    height: 48,
                                    color: Colors.pinkAccent,
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Playlist',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black87)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.shuffle,
                                color: Colors.pinkAccent,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Icon(Icons.repeat)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.02,
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 70,
                key: Key('asd'),
                delegate: SliverChildListDelegate(_listOfSongs()),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.12,
                ),
              )
            ],
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.11,
              initialChildSize: 0.11,
              builder:
                  (BuildContext context, _controller) {
                print(_controller);
                return ListView(
                  controller: _controller,
                  children: [
                    if (_controller.position.viewportDimension<250) Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.zero,
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.zero),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(35),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                    )
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 27, top: 18, right: 27, bottom: 200),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('Now Playing',
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18)),
                                            Text(
                                              'Smoke and Mirrors',
                                              style: TextStyle(
                                                  fontSize: 27,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.pause,
                                          color: Colors.pinkAccent,
                                          size: 25,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ) else Container(
                            height: height * 0.8,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: height * 0.1,
                                  child: Container(
                                    width: width,
                                    height: height * 0.7,
                                    child: Column(
                                      children: <Widget>[Text('AiVe he')],
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  left: width * 0.25,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.pinkAccent.withAlpha(45),
                                            spreadRadius: 10,
                                            blurRadius: 15,
                                          )
                                        ],
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://s3.pixers.pics/pixers/700/FO/31/35/71/52/700_FO31357152_6926a958429334b5f5661ca2e3cd8843.jpg'),
                                            fit: BoxFit.fill)),
                                    height: height * 0.25,
                                    width: height * 0.25,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.32,
                                      ),
                                      Text(
                                        'Smoke And Mirrors',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        'Imagine Dragons',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black45),
                                      ),
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      //lyrics
                                      Text(
                                        'All I believe, Is it a dream?',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black26),
                                      ),
                                      Text(
                                        'That comes crashing down on me?',
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        'All that I own\nIs it just smoke and mirrors?',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black26),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: height*0.05,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            LinearProgressIndicator(
                                              backgroundColor: Colors.black.withAlpha(20),
                                              value: 0.2,
                                              valueColor:  AlwaysStoppedAnimation<Color>(Colors.pinkAccent)
                                            ),
                                            SizedBox(height: height*0.01,),
                                            Text('4:40',style: TextStyle(fontSize: 17),)
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Icon(Icons.skip_previous),
                                          Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Icon(Icons.play_arrow,color: Colors.white,size: 30,),
                                              ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Color.fromRGBO(33, 81, 103,1)
                                          ),),
                                          Icon(Icons.skip_next,)
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                  ],
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
