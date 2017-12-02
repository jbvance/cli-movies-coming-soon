 require 'pry'

class MovieList::CLI

    def initialize
         
    end
    
    def call
       header
       MovieList::Movie.new.class.list_movies
       footer
       puts "Enter the number of the movie you would like to view, or type 'exit'"
    end
    
    def header
       puts "---------------------MOVIES COMING SOON------------------------" 
    end
    
    def footer
        puts "--------------------------------------------------------------"
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
