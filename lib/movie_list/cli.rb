class MovieList::CLI
    
    
    require 'pry'
    
    def initialize
         
    end
    
    def call
        list_movies
       puts "Enter the number of the movie you would like to view, or type 'exit'"
    end
    
    def header
       puts "---------------------MOVIES COMING SOON------------------------" 
    end
    
    def footer
        puts "--------------------------------------------------------------"
    end
    
    def list_movies
        header
        movie_list = []
        doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
        movies = doc.css('#main').css('.list').css('div.list_item')
        #code to get first movie title
        movies.each_with_index do |movie, index|
            puts "#{index + 1}. #{movies[index].css('h4').children.attr('title').value}"
        end
        footer
        
        #binding.pry
        MovieList::Movie.new
    end
    
    def menu
        #display movies coming soon
        puts "Enter your choice number or type 'exit'"
        input = gets.strip.downcase
        
        
        while input != 'exit'
            puts "You entered #{input}"
            input = gets.strip.downcase
        end
        puts "GOODBYE!"
    end
    
end
