require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_name = Song.new(name)
  end

  def self.create_by_name(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find do |songs|
      # binding.pry
      songs.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    # binding.pry
    self.all.sort {|x,y| x.name <=> y.name}
  end

  def self.new_from_filename(file)
    new_filename = Song.new(file)
    newer = new_filename.name.gsub(".", " - ").split(" - ")
    new_filename.name = newer[1]
    new_filename.artist_name = newer[0]
    new_filename
  end

  def self.create_from_filename(name)
    new_song = self.new_from_filename(name)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
