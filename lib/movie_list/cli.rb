 require 'pry'

class MovieList::CLI

    def initialize
         
    end
    
    def call
       header
       MovieList::Movie.list_movies
       footer
       menu
    end
    
    def header
       puts "---------------------MOVIES COMING SOON------------------------" 
    end
    
    def footer
        puts "--------------------------------------------------------------"
    end
    
    def menu_instruction
         puts "Enter the number of the movie you would like to view, type 'list' to list the movies, or type 'exit'"
    end
    
    def menu
        self.menu_instruction
        input = gets.strip.downcase
        while input != 'exit'
            #puts "You entered #{input}"
            if input.to_i != 0 && input.to_i < MovieList::Movie.all.length + 1
                int = input.to_i
                MovieList::Movie.movie_details(int)
            elsif input ==  'list'
                MovieList::Movie.list_movies
                self.menu_instruction
            else
                puts "Please enter a valid number or type 'exit'"
            end
            input = gets.strip
        end
        puts "GOODBYE!"
    end
    
end
