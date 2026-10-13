class Film {
  final String id;
  final String title;
  final String yearReleased;
  final String rating;
  final String room;
  final String screeningDate;
  final String screeningTime;
  final String synopsis;
  final double adultPrice;
  final String imagePath;

  const Film({
    required this.id,
    required this.title,
    required this.yearReleased,
    required this.rating,
    required this.room,
    required this.screeningDate,
    required this.screeningTime,
    required this.synopsis,
    required this.adultPrice,
    required this.imagePath,
  });
}
