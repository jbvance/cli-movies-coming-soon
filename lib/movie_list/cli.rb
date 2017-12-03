 require 'pry'

class MovieList::CLI

    def initialize
         
    end
    
    def call
        MovieList::Movie.header
        MovieList::Movie.list_movies
        MovieList::Movie.footer
        controller
    end
    
    def menu_instruction
         puts "Enter the number of the movie you would like to view, type 'list' to list the movies, or type 'exit'"
    end
    
    def controller
        #MovieList::Movie.header
        self.menu_instruction
        input = gets.strip.downcase
        while input != 'exit'
            #puts "You entered #{input}"
            if input.to_i != 0 && input.to_i < MovieList::Movie.all.length + 1
                int = input.to_i
                MovieList::Movie.movie_details(int)
                menu_instruction
            elsif input ==  'list'
                MovieList::Movie.header
                MovieList::Movie.list_movies
                MovieList::Movie.footer
                self.menu_instruction
            else
                puts "Please enter a valid number, type 'list' to see a list of movies, or type 'exit'"
            end
            input = gets.strip
        end
        puts "See you at the movies! Thanks for using the 'Coming Soon' app!"
    end
    
end
