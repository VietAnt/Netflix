//--TrailerMovie--Danh sach TrailerMovie--//
class TrailersMovie {
  final String image;

  //--Contructor(trailermovie)--//
  const TrailersMovie(this.image);

  //--Danhsach TrailerMoive--//
  static List<TrailersMovie> listTrailers = [
    TrailersMovie('cinema/movie6.jpg'),
    TrailersMovie('cinema/movie5.jpg'),
    TrailersMovie('cinema/movie1.jpg'),
    TrailersMovie('cinema/movie2.jpg'),
    TrailersMovie('cinema/movie3.jpg'),
    TrailersMovie('cinema/movie4.jpg'),
  ];
}
