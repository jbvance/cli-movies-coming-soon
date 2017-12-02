require 'pry'

class MovieList::Movie
    
    @@all = []
    
    def initialize
        puts "Movie class Initiated"
    end
    
    def self.build_movie_list
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
            movie_item[:actors] = build_actor_list(movie.css("span[itemprop=actors]"))
            @@all << movie_item
        end
    end
    
    def self.movie_details(id)
       movie = self.all.find {|movie| movie[:id] == id}
       #binding.pry
       puts "-----------------------------------------"
        puts movie[:title]
       puts "Summary: #{movie[:description].delete("\n")}"
       puts "Stars: #{movie[:actors].join(", ")}"
       puts "Director: #{movie[:director]}"
       puts "-----------------------------------------"
    end
    
    def self.build_actor_list(actors)
         actors.collect do |actor|
            actor.css('a[href]').text 
         end
    end
    
    def self.all
        @@all
    end
    
    def self.list_movies
        self.build_movie_list if self.all.length == 0
        # Loop through all movies and display number and title
        @@all.each_with_index do |movie, index|
            puts "#{movie[:id]}. #{movie[:title]}"
        end
    end
end
