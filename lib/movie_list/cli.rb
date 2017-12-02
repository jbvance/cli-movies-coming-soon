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
    
    
    
    def menu
         puts "Enter the number of the movie you would like to view, or type 'exit'"
        input = gets.strip
        while input != 'exit'
            #puts "You entered #{input}"
            if input.to_i != 0 && input.to_i < MovieList::Movie.all.length + 1
                int = input.to_i
                puts MovieList::Movie.movie_details(int)
            else
                puts "Please enter a valid number or type 'exit'"
            end
            input = gets.strip
        end
        puts "GOODBYE!"
    end
    
end
