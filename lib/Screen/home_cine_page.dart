import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netflix/Models/movie_model.dart';
import 'package:netflix/Models/trailers_model.dart';
import 'package:netflix/Screen/details_movie_page.dart';
import 'package:netflix/widgets/textfrave.dart';

class HomeCinePage extends StatelessWidget {
  const HomeCinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21242C),
      appBar: AppBar(
        backgroundColor: const Color(0xff21242C),
        leading: const Icon(Icons.menu, color: Colors.white, size: 30),
        elevation: 0,
        actions: [
          const Icon(Icons.search, color: Colors.white, size: 30),
          const SizedBox(width: 15),
          const Icon(Icons.notifications_rounded,
              color: Colors.white, size: 30),
          const SizedBox(width: 15),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('cinema/logo-white.png'))),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          const _ItemTitle(title: 'Trailer'),
          const SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            height: 200,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal, //dung de keo sang ngang
                itemCount: TrailersMovie.listTrailers.length,
                itemBuilder: (context, i) =>
                    _ItemTrailers(trailers: TrailersMovie.listTrailers[i])),
          ),
          const SizedBox(height: 20),
          const _ItemTitle(title: 'Now Cinema'),
          Container(
            height: 280,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: MovieModel.listMovie.length,
              itemBuilder: (context, i) => _ItemsNowCinemas(
                  movieModel: MovieModel.listMovie[i]), //dung keo sang ngang
            ),
          ),
          const SizedBox(height: 20),
          _ItemTitle(title: 'Coming soon'),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 300,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: MovieModel.listMovie.length,
              itemBuilder: (context, i) =>
                  _ItemsSoonMovie(movieModel: MovieModel.listMovie[i + 2]),
            ),
          )
        ],
      ),
    );
  }
}

//--ItemSoonCinema--(Chieu som)//
class _ItemsSoonMovie extends StatelessWidget {
  final MovieModel movieModel;
  const _ItemsSoonMovie({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(movieModel.image),
                  )),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 160,
              child: TextFrave(text: movieModel.name, color: Colors.white),
            ),
            SizedBox(height: 5.0),
            RatingBar.builder(
                itemSize: 22,
                initialRating: movieModel.qualification,
                itemBuilder: (_, i) => const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                onRatingUpdate: (_) {})
          ],
        ),
      ),
    );
  }
}

//--ItemNowCinema-PhimDangChieu--//
class _ItemsNowCinemas extends StatelessWidget {
  //--Khai bao bien MovieModal --//
  final MovieModel movieModel;
  const _ItemsNowCinemas({Key? key, required this.movieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //thay doi giao dien
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsMoviePage(movieModel: movieModel)));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //--Hieu ung chuyen canh-Her0--//
            Hero(
                tag: 'movie-hero-${movieModel.id}',
                child: Container(
                    //--hinh anh--//
                    height: 210,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(movieModel.image))))),
            const SizedBox(height: 15),
            SizedBox(
              width: 160,
              child: TextFrave(text: movieModel.name, color: Colors.white),
            ),
            const SizedBox(height: 5),
            RatingBar.builder(
              itemSize: 22,
              initialRating: movieModel.qualification,
              itemBuilder: (_, i) =>
                  const Icon(Icons.star_rate_rounded, color: Colors.amber),
              onRatingUpdate: (_) {},
            )
          ],
        ),
      ),
    );
  }
}

//--ItemTrailer--//
class _ItemTrailers extends StatelessWidget {
  final TrailersMovie trailers; //--bien goi class--//
  const _ItemTrailers({Key? key, required this.trailers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(trailers.image))),
          ),
          Container(
            width: 300,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white.withOpacity(0.3),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//--ItemTile--//
class _ItemTitle extends StatelessWidget {
  final String title;
  const _ItemTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFrave(
                text: title,
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500),
            const TextFrave(text: 'View all', color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
