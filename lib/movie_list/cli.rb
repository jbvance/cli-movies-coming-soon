class MovieList::CLI
    
    
    require 'pry'
    
    def initialize
         
    end
    
    def call
        puts "Movie List"
        list_movies
    end
    
    def list_movies
        menu
    end
    
    def menu
        #display movies coming soon
        puts "Enter your choice number or type 'exit'"
        input = gets.strip.downcase
        doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
        movies = doc.css('#main').css('.list').css('div.list_item')
        #code to get first movie title
        #movies[0].css('h4').children.attr('title').value
        #binding.pry
        
        while input != 'exit'
            puts "You entered #{input}"
            input = gets.strip.downcase
        end
        puts "GOODBYE!"
    end
    
end
