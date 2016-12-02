require 'pry'

class Artist
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    bool = @@all.any? { |artists| artists.name == self.name }

    if !bool
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    self.all.each do |artist|
      if artist.name == name
        return artist
      else
        self.new(name).save
      end
    end
  end

  def print_songs
    songs.each{ |song| puts song.name }
  end
end
