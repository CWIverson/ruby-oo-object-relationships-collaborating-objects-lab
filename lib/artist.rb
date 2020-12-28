require 'pry'
class Artist
    @@all=[]
    attr_accessor :name
    def initialize(name)
        @name=name
        @@all << self
        @songs=[]
    end
    def self.all
        @@all
    end
    def songs
        Song.all.each do |song|
            #binding.pry
            artist_songs=[]
              if (song.artist == self) && !(@songs.include?(song))
                @songs<<song
               #binding.pry
              end
        end
        @songs
    end
    def add_song(song)
        if !(@songs.include?(song))
           # binding.pry
            song.artist=self
            @songs << song
        end
        
    end
    def self.find_or_create_by_name(name)
        artist_new=''
        artist_found=''
        artist_match=[]
        self.all.each do |artist|
            if artist.name == name
                artist_match<<artist
            
            end
        end
        if artist_match.length == 0
            artist_new=Artist.new(name)
            artist_new
        else
            artist_found=artist_match[0]
            artist_found
        end
    end
    def print_songs
        
        @songs.each do |song|
            puts song.name
        end
    end
end