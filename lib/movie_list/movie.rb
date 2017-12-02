class MovieList::Movie
    
    @@all = []
    
    def initialize
        puts "Movie class Initiated"
        # Store the html from the url
         doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
         
        # Create the class level variable for all the movies
        movies = doc.css('#main').css('.list').css('div.list_item')
        movies.each_with_index do |movie, index|
            @@all << movie
        end
    end
    
    def self.list_movies
        # Loop through all movies and display number and title
        @@all.each_with_index do |movie, index|
            puts "#{index + 1}. #{@@all[index].css('h4').children.attr('title').value}"
        end
    end
end
