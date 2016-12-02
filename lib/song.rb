require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist_and_song = filename.split(" - ")
    song = self.new(artist_and_song[1].strip)
    artist = Artist.new(artist_and_song[0].strip)
    artist.add_song(song)
    artist.save
    song.artist = artist
    song
  end
end
