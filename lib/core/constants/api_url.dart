class ApiUrl {

  static const baseURL = 'http://api.themoviedb.org/3/'; 

  static const trendingMovies = '${baseURL}trending/movie/week';
  static const nowPlayingMovies = '${baseURL}movie/now_playing';
  static const video = '${baseURL}movie/{movie_id}/videos';
  static const movieCredits = '${baseURL}movie/{movie_id}/credits';

}