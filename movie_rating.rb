require 'imdb'

class MovieRating
  def open_file(file)
    open_file = File.open("#{file}", 'r').read
    @split = open_file.split("\n")
  end

  def go_to_imdb
    movie_obj_arr = []
    @split.each do |movie_titles|
      movie_obj_arr << Imdb::Search.new(movie_titles).movies.first
    end
    #print movie_obj_arr
  end

  def get_the_rating
    movie_rating_arr = []
    @split.each do |movie_rating|
      movie_rating2 = Imdb::Search.new(movie_rating).movies.first
      movie_rating_arr << movie_rating2.rating
    end
    print movie_rating_arr
  end
end

rate_movie = MovieRating.new
puts "Enter file to process"
print ">/"
input_file = gets.chomp

rate_movie.open_file(input_file)
print rate_movie.go_to_imdb
print rate_movie.get_the_rating