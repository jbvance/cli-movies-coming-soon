require 'pry'

class MovieList::Movie
    
    @@all = []
    
    def initialize
        puts "Movie class Initiated"
        # Store the html from the url
         doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
         
        # Create the class level variable for all the movies
        movies = doc.css('#main').css('.list').css('div.list_item')
        movies.each_with_index do |movie, index|
            movie_item = {}
            movie_item[:id] = index + 1
            movie_item[:title] = movie.css('h4').children.attr('title').value
            movie_item[:description] = movie.css('div.outline').text
            @@all << movie_item
        end
        binding.pry
    end
    
    def self.all
        @@all
    end
    
    def self.list_movies
        # Loop through all movies and display number and title
        @@all.each_with_index do |movie, index|
            puts "#{movie[:id]}. #{movie[:title]}"
        end
        #binding.pry
    end
end
