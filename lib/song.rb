require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  #def initialize(name, artist_name)
   # @name = name
   #@artist_name = artist_name
  #end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end
  def self.new_by_name(arg)
    song = self.new
    song.name = arg
    song
  end
  def self.create_by_name(arg)
    song = self.create
    song.name = arg
    song
  end
  def self.find_by_name(arg)
    self.all.detect{|x| x.name == arg}
  end
  def self.find_or_create_by_name(arg)
    self.find_by_name(arg) || self.create_by_name(arg)
  end
  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end
  def self.new_from_filename(file)
    separte = file.split(" - ")
    artist_name = separte[0]
    name = separte[1].gsub(".mp3", "")

    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end
  def self.create_from_filename(file)
    separte = file.split(" - ")
    artist_name = separte[0]
    name = separte[1].gsub(".mp3", "")

    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end
  def self.destroy_all
    self.all.clear
  end
end
