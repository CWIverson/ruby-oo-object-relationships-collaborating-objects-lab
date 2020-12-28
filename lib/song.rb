class Song
    @@all=[]
    attr_accessor :name
    def initialize(name,artist="unknown")
        @name=name
        @artist=artist
        @@all << self
    end
    def artist=(artist)
        @artist = artist
        #binding.pry
    end
    def artist
        @artist
       # binding.pry
    end
    def self.all
        @@all
    end
    def self.new_by_filename(filename)
        
        capture_array=filename.split(/\s-\s/)
        artist_name=capture_array[0]
        song_name= capture_array[1]
        new_song=Song.new(song_name)
        artist = Artist.find_or_create_by_name(artist_name)
        new_song.artist= artist
        #binding.pry
        new_song
    end
    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist= artist

    end
end