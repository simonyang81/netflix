class ApiUrl {

  static const baseURL = 'http://api.themoviedb.org/3/'; 

  static const trendingMovies = '${baseURL}trending/movie/week';
  static const nowPlayingMovies = '${baseURL}movie/now_playing';
  static const video = '${baseURL}movie/{movie_id}/videos';
  static const movieCredits = '${baseURL}movie/{movie_id}/credits';

  static const person = '${baseURL}person/{person_id}';
  static const personMovies = '${baseURL}person/{person_id}/movie_credits';

  static const trendingTVs = '${baseURL}trending/tv/week';
  static const tvVideo = '${baseURL}tv/{series_id}/videos';
  static const tvSeriesDetail = '${baseURL}tv/{series_id}';
  static const tvCredits = '${baseURL}tv/{series_id}/credits';

}