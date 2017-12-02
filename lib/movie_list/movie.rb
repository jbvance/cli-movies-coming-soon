require 'pry'

class MovieList::Movie
    
    @@all = []
    
    def initialize
        puts "Movie class Initiated"
    end
    
    def self.build_movie_list
        puts 'BUILDING LIST'
         # Store the html from the url
         doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
         
        # Create the class level variable for all the movies
        movies = doc.css('#main').css('.list').css('div.list_item')
        movies.each_with_index do |movie, index|
            movie_item = {}
            movie_item[:id] = index + 1
            movie_item[:title] = movie.css('h4').children.attr('title').value
            movie_item[:description] = movie.css('div.outline').text
            movie_item[:director] = movie.css("span[itemprop=director]").css('a[href]').text
            @@all << movie_item
        end
    end
    
    def self.all
        @@all
    end
    
    def self.list_movies
        puts 'GOT HERE'
        self.build_movie_list if self.all.length == 0
        # Loop through all movies and display number and title
        @@all.each_with_index do |movie, index|
            puts "#{movie[:id]}. #{movie[:title]}"
        end
        #binding.pry
    end
end
