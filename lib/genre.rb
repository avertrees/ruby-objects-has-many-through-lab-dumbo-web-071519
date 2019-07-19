class Genre
#     **The `Genre` model:**


# - The `Genre` class needs an instance method, `#artists`, that iterates over the
#   genre's collection of songs and collects the artist that owns each song.

    @@all = []

    attr_accessor :name
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select do |song|
            song.genre == self
        end
    end

    def artists
        self.songs.map do |song|
            song.artist
        end
    end

    def self.all 
        @@all
    end

end