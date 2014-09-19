require 'imdb'

class MovieRating

  def get_movie_name
    my_movie_list = ["Ghostbusters", "Die Hard"]


    @search = Imdb::Search.new("#{my_movie_list}")
    movie = Imdb::Movie.new("#{@search}")
    
    puts "#{movie.title} + #{movie.rating}"


    
  end
end

get_movie = MovieRating.new

p get_movie.get_movie_name