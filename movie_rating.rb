require 'imdb'

class MovieRating
  def open_file(file)
    open_file = File.open("#{file}", 'r').read
    @split = open_file.split("\n")
  end

  def go_to_imdb
    movie_obj_arr = []
    @split.each do |movie_titles|
      get_the_movie = Imdb::Search.new(movie_titles).movies.first
      movie_obj_arr << get_the_movie.title
    end
    puts movie_obj_arr
    puts 
  end

  def get_the_rating
    @movie_rating_arr = []
    @split.each do |movie_rating|
      movie_rating2 = Imdb::Search.new(movie_rating).movies.first
      @movie_rating_arr << movie_rating2.rating
    end
    @movie_rating_arr
    puts
  end

  def write_rating_stars_to_screen
    @movie_rating_arr.each do |star|
      puts "*" * 1 if star > 1.0 && star < 3.0
      puts "*" * 2 if star > 3.1 && star < 5.0
      puts "*" * 3 if star > 5.1 && star < 7.0
      puts "*" * 4 if star > 7.1 && star < 8.0
      puts "*" * 5 if star > 8.1 && star < 10.0
    end
  end
end

rate_movie = MovieRating.new
puts "Enter file to process"
print ">/"
input_file = gets.chomp

rate_movie.open_file(input_file)
print rate_movie.go_to_imdb
print rate_movie.get_the_rating
rate_movie.write_rating_stars_to_screen