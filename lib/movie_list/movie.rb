class MovieList::Movie
    
    @@all = []
    
    def initialize
        puts "Movie class Initiated"
         doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
        movies = doc.css('#main').css('.list').css('div.list_item')
        movies.each_with_index do |movie, index|
            @@all << movie
            
        end
    end
    
    def self.list_movies
        @@all.each_with_index do |movie, index|
            puts "#{index + 1}. #{@@all[index].css('h4').children.attr('title').value}"
        end
    end
end
