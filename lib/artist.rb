require 'pry'
require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/paramable'
class Artist
  extend Memorable::ClassMethods
  include Paramable, Memorable::InstanceMethods
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    super
    @songs = []
  end

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end

  # def self.reset_all
  #   self.all.clear #>clear method actually mutates the array 
  # end

  # def self.count
  #   self.all.count #>counts the number of
  # end

  def add_song(song)
  # when i add a song , informaiton going is is an instance of Song 
  #   then because i add songs i want to move this info to the artists songs array
  #   now as a artist can have many songs this is why we shovel it however
  #   a song can only belong to an artist so when we created a instace of a Song
  #   we must make sure a certain song will match its artist
  #   so song.artist = self > the instance info assigned to 
  #   attr_reader  :artist. at this point within the Song class.all 
  #   will hold info refering to a song and its name 

    @songs << song
    song.artist = self 
  end

  def add_songs(songs) #> this is what is being passed in [song,Song.new]
    songs.each { |song| add_song(song) } #> then running the same
    # add_song() on each element 
  end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end
  binding.pry
end

